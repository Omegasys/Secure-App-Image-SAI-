use serde_json::Value;

/// Evaluates runtime app policy requests against permissions
pub struct PolicyEngine {
    pub policy: Value,
}

impl PolicyEngine {
    pub fn new(policy_json: &str) -> Self {
        let policy: Value = serde_json::from_str(policy_json)
            .expect("Invalid policy JSON");

        Self { policy }
    }

    pub fn check_network(&self) -> bool {
        match self.policy["network"].as_str().unwrap_or("none") {
            "none" => false,
            "local" => true,
            "restricted" => true,
            "full" => true,
            _ => false,
        }
    }

    pub fn check_filesystem(&self, path: &str) -> bool {
        if path.starts_with("/home") {
            return self.policy["filesystem"]["home"]
                .as_str()
                .unwrap_or("none") != "none";
        }

        if path.starts_with("/app") {
            return true;
        }

        false
    }

    pub fn check_device(&self, device: &str) -> bool {
        self.policy["devices"][device]
            .as_bool()
            .unwrap_or(false)
    }
}
