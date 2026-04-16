use sha2::{Sha256, Digest};
use std::fs::{self, File};
use std::io::{Read, Write};
use std::path::Path;

/// Generates a SHA256 manifest for all files in a directory
pub fn generate_manifest(dir: &str, output: &str) -> std::io::Result<()> {
    let mut manifest = String::new();

    for entry in fs::read_dir(dir)? {
        let entry = entry?;
        let path = entry.path();

        if path.is_file() {
            let hash = hash_file(&path)?;
            manifest.push_str(&format!(
                "{}  {}\n",
                hash,
                path.display()
            ));
        }
    }

    let mut file = File::create(output)?;
    file.write_all(manifest.as_bytes())?;

    Ok(())
}

fn hash_file(path: &Path) -> std::io::Result<String> {
    let mut file = File::open(path)?;
    let mut hasher = Sha256::new();
    let mut buffer = [0u8; 4096];

    loop {
        let bytes_read = file.read(&mut buffer)?;
        if bytes_read == 0 {
            break;
        }
        hasher.update(&buffer[..bytes_read]);
    }

    Ok(format!("{:x}", hasher.finalize()))
}
