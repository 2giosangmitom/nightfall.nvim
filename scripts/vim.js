import { readFile, readdir, writeFile } from "node:fs";
import { basename } from "node:path";

// Constants
const DATA_DIR = `${process.env.HOME}/.cache/nvim/nightfall/`;
const CWD = process.cwd();

/**
 * Reads a JSON file and returns its contents.
 * @param {string} file - Path to the JSON file.
 * @param {function} callback - Callback function to handle the file contents.
 */
function readJsonFile(file, callback) {
  readFile(file, { encoding: "utf-8" }, callback);
}

/**
 * Generates a Vim highlight command string.
 * @param {string} group - Vim group name.
 * @param {object} groupOpts - Options for the Vim group.
 * @returns {string} Vim highlight command string.
 */
function generateVimHighlightCommand(group, groupOpts) {
  let command = `hi ${group}`;

  // Add foreground, background, and special colors
  if (groupOpts.fg) command += ` guifg=${groupOpts.fg}`;
  if (groupOpts.bg) command += ` guibg=${groupOpts.bg}`;
  if (groupOpts.sp) command += ` guisp=${groupOpts.sp}`;

  // Add style options
  const styleOptions = [];
  for (const option in groupOpts) {
    if (option === "style" && typeof groupOpts.style === "object") {
      for (const style in groupOpts.style) {
        if (groupOpts.style[style]) styleOptions.push(style);
      }
    } else if (
      groupOpts[option] &&
      option !== "fg" &&
      option !== "bg" &&
      option !== "sp"
    ) {
      styleOptions.push(option);
    }
  }
  if (styleOptions.length > 0)
    command += ` gui=${styleOptions.sort().join(",")}`;

  // Add terminal colors
  command += " cterm=none";

  return command;
}

// Read JSON files in the data directory
readdir(DATA_DIR, { encoding: "utf-8" }, (err, files) => {
  if (err) {
    console.error(err);
    return;
  }

  // Filter JSON files
  const jsonFiles = files
    .filter((file) => file.endsWith(".json"))
    .map((file) => `${DATA_DIR}${file}`);

  // Process each JSON file
  jsonFiles.forEach((file) => {
    readJsonFile(file, (err, data) => {
      if (err) {
        console.error(err);
        return;
      }

      // Parse JSON data
      const jsonData = JSON.parse(data);

      // Handle core groups
      if (jsonData.core) {
        const flavor = basename(file, ".json");
        let vimContent = `" This file is auto-generated, do not edit.
let g:colors_name = "${flavor}"
hi clear
set termguicolors

`;

        // Generate Vim highlight commands
        Object.keys(jsonData.core)
          .sort()
          .forEach((group) => {
            vimContent +=
              generateVimHighlightCommand(group, jsonData.core[group]) + "\n";
          });

        // Write Vim colorscheme file
        const outputFile = `${CWD}/extras/vim/colors/${flavor}.vim`;
        writeFile(outputFile, vimContent, { encoding: "utf-8" }, (err) => {
          if (err) {
            console.error(err);
          } else {
            console.log(`Generated Vim colorscheme to ${outputFile}`);
          }
        });
      }
    });
  });
});
