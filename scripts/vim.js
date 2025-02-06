const fs = require("node:fs");
const path = require("node:path");
const process = require("node:process");

const cwd = process.cwd();
const dataDir = process.env.HOME.concat("/.cache/nvim/nightfall/");

function parseJson(file, callback) {
	fs.readFile(file, { encoding: "utf-8" }, callback);
}

/**
 * Return the highlight command string in vim
 * @param {string} group
 * @param {object} groupOpts
 */
function vimmify(group, groupOpts) {
	let res = `hi ${group}`;

	let style = [];
	for (const opt in groupOpts) {
		if (opt === "fg") {
			res += ` guifg=${groupOpts.fg}`;
		} else if (opt === "bg") {
			res += ` guibg=${groupOpts.bg}`;
		} else if (opt === "sp") {
			res += ` guisp=${groupOpts.sp}`;
		} else if (opt === "style" && typeof opt === "object") {
			for (const s in opt.style) {
				if (opt.style[s]) {
					style.push(s);
				}
			}
		} else {
			if (opt === "style") {
				// Skip empty style
				continue;
			}
			if (groupOpts[opt]) {
				style.push(opt);
			}
		}
	}
	style = style.sort();

	if (style.length !== 0) {
		res += ` gui=${style.join(",")}`;
	}
	res += " cterm=none";

	return res;
}

fs.readdir(dataDir, { encoding: "utf-8" }, (err, files) => {
	if (err) {
		console.error(err);
		return;
	}

	let jsonFiles = files.filter((file) => file.endsWith(".json"));
	jsonFiles = jsonFiles.map((v) => dataDir + v);

	for (const f of jsonFiles) {
		parseJson(f, (err, data) => {
			if (err) {
				console.error(err);
				return;
			}

			const json = JSON.parse(data);

			// Handle core groups
			if (json.core) {
				const flavor = path.basename(f, ".json");
				let vim = `" This file is auto-generated, do not edit.
let g:colors_name = "${flavor}"
hi clear
set termguicolors

`;

				for (const group of Object.keys(json.core).sort()) {
					vim += vimmify(group, json.core[group]);
					vim += "\n";
				}

				fs.writeFile(
					`${cwd}/extras/vim/colors/${flavor}.vim`,
					vim,
					{
						encoding: "utf-8",
					},
					(err) => {
						if (err) {
							console.error(err);
						} else {
							console.log(
								`Generated vim colorscheme to ${cwd}/extras/vim/colors/${flavor}.vim`,
							);
						}
					},
				);
			}
		});
	}
});
