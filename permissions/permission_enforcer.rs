use serde_json::Value;
use std::fs;

/// Loads permission schema and evaluates runtime permissions
pub struct PermissionEnforcer {
    schema: Value,
}

impl PermissionEnforcer {
    pub fn new(schema_path: &str) -> Self {
        let data = fs::read_to_string(schema_path)
            .expect("Failed to read permission schema");

        let schema: Value = serde_json::from_str(&data)
            .expect("Invalid JSON schema");

        Self { schema }
    }

    pub fn is_allowed(&self, permission: &str, key: &str) -> bool {
        let default_policy = self.schema["default_policy"]
            .as_str()
            .unwrap_or("deny");

        let perm = &self.schema["permissions"][permission];

        if perm.is_null() {
            return default_policy == "allow";
        }

        match perm[key].as_bool() {
            Some(value) => value,
            None => default_policy == "allow",
        }
    }

    pub fn debug_dump(&self) {
        println!("[SAI] Loaded Permission Schema:\n{}", self.schema);
    }
}
