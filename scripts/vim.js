import {
  readdirSync,
  readFileSync,
  writeFileSync,
  mkdirSync,
  existsSync,
} from "node:fs";
import { homedir } from "node:os";
import { join, basename } from "node:path";
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

try {
  ensureDirectoryExistence(OUTPUT_DIR);

  const files = readdirSync(CACHE_DIR);
  const jsonFiles = files.filter((file) => file.endsWith(".json"));

  if (jsonFiles.length === 0) {
    console.log("No JSON files found in the directory.");
  } else {
    jsonFiles.forEach((file) => {
      const filePath = join(CACHE_DIR, file);
      const vimFile = join(OUTPUT_DIR, `${basename(filePath, ".json")}.vim`);

      try {
        const content = readFileSync(filePath, "utf-8");
        const json = JSON.parse(content);
        let vimContent = `let g:colors_name = "${basename(file, ".json")}"\nhi clear\n`;

        for (const [key, val] of Object.entries(json.core)) {
          let line = `hi ${key}`;
          let styles = [];
          for (const key in val) {
            if (typeof val[key] === "string") {
              if (key === "fg") {
                line += ` guifg=${val[key]}`;
              }
              if (key === "bg") {
                line += ` guibg=${val[key]}`;
              }
              if (key === "sp") {
                line += ` guisp=${val[key]}`;
              }
            }
            if (typeof val[key] === "boolean") {
              if (val[key]) {
                styles.push(key);
              }
            }
            if (typeof val[key] === "object") {
              for (const k in val[key]) {
                if (val[key][k]) {
                  styles.push(k);
                }
              }
            }
          }

          if (styles.length !== 0) {
            line += ` gui=${styles.join(",")}`;
          }
          vimContent += line.concat("\n");
        }

        writeFileSync(vimFile, vimContent);
        console.log(`Vim colorscheme written to ${vimFile}`);
      } catch (readError) {
        console.error(`Error reading file ${file}:`, readError.message);
      }
    });
  }
} catch (dirError) {
  console.error(`Error accessing directory ${CACHE_DIR}:`, dirError.message);
}
