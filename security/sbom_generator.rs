use std::fs::{self, File};
use std::io::Write;
use std::path::Path;

/// Minimal SBOM generator (Software Bill of Materials)
pub fn generate_sbom(dir: &str, output: &str) -> std::io::Result<()> {
    let mut sbom = String::new();

    sbom.push_str("{\n");
    sbom.push_str("  \"type\": \"SAI_SBOM\",\n");
    sbom.push_str("  \"files\": [\n");

    for entry in fs::read_dir(dir)? {
        let entry = entry?;
        let path = entry.path();

        if path.is_file() {
            sbom.push_str(&format!(
                "    \"{}\",\n",
                path.display()
            ));
        }
    }

    sbom.push_str("  ]\n");
    sbom.push_str("}\n");

    let mut file = File::create(output)?;
    file.write_all(sbom.as_bytes())?;

    Ok(())
}
