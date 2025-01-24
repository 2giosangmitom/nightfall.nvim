import {
  readdirSync,
  readFileSync,
  writeFileSync,
  mkdirSync,
  existsSync,
} from "node:fs";
import { homedir } from "node:os";
import { join, basename, extname } from "node:path";
import { cwd } from "node:process";

// Define the cache directory and current working directory
const CACHE_DIR = join(homedir(), ".cache/nvim/nightfall/");
const CURRENT_DIR = cwd();
const OUTPUT_DIR = join(CURRENT_DIR, "extras/vim");

// Function to ensure directory exists, create if it doesn't
function ensureDirectoryExistence(dir) {
  if (!existsSync(dir)) {
    mkdirSync(dir, { recursive: true });
  }
}

// Function to process JSON content and generate Vim script
function processJsonContent(filePath, outputDir) {
  const fileName = basename(filePath, extname(filePath));
  const vimFile = join(outputDir, `${fileName}.vim`);

  try {
    const content = readFileSync(filePath, "utf-8");
    const json = JSON.parse(content);

    // Initialize vimContent with the colorscheme name and clear command
    let vimContent = `let g:colors_name = "${fileName}"\nhi clear\n`;

    // Process 'core' key if it exists
    if (json.core) {
      for (const [key, val] of Object.entries(json.core).sort()) {
        let line = `hi ${key}`;
        const styles = [];

        for (const [attrKey, attrValue] of Object.entries(val)) {
          if (typeof attrValue === "string") {
            if (attrKey === "fg") line += ` guifg=${attrValue}`;
            if (attrKey === "bg") line += ` guibg=${attrValue}`;
            if (attrKey === "sp") line += ` guisp=${attrValue}`;
          }
          if (typeof attrValue === "boolean" && attrValue) {
            styles.push(attrKey);
          }
          if (typeof attrValue === "object") {
            for (const [styleKey, styleValue] of Object.entries(attrValue)) {
              if (styleValue) styles.push(styleKey);
            }
          }
        }

        if (styles.length > 0) {
          line += ` gui=${styles.join(",")}`;
        }
        vimContent += line.concat("\n");
      }
    }

    writeFileSync(vimFile, vimContent);
    console.log(`Vim colorscheme written to ${vimFile}`);
  } catch (readError) {
    console.error(`Error reading file ${filePath}:`, readError.message);
  }
}

try {
  // Ensure the output directory exists
  ensureDirectoryExistence(OUTPUT_DIR);

  // Read all files in the cache directory
  const files = readdirSync(CACHE_DIR);
  const jsonFiles = files.filter((file) => file.endsWith(".json"));

  if (jsonFiles.length === 0) {
    console.log("No JSON files found in the directory.");
  } else {
    for (const file of jsonFiles) {
      const filePath = join(CACHE_DIR, file);
      processJsonContent(filePath, OUTPUT_DIR);
    }
  }
} catch (dirError) {
  console.error(`Error accessing directory ${CACHE_DIR}:`, dirError.message);
}
