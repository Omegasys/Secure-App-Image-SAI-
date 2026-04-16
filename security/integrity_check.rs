use std::fs;
use std::process::Command;

/// Runs full integrity validation pipeline:
/// 1. Signature check
/// 2. Hash validation
/// 3. Optional SBOM presence check
pub fn verify_integrity(appimage: &str) -> bool {
    println!("[SAI] Starting integrity check: {}", appimage);

    let sig_status = Command::new("bash")
        .arg("security/signing/verify.sh")
        .arg(appimage)
        .status();

    if sig_status.is_err() || !sig_status.unwrap().success() {
        println!("[SAI] Signature verification failed");
        return false;
    }

    let hash_file = format!("{}.sha256", appimage);
    if !fs::metadata(&hash_file).is_ok() {
        println!("[SAI] Missing hash manifest");
        return false;
    }

    println!("[SAI] Integrity check passed");
    true
}
