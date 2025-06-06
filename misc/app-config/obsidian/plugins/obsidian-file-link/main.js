/*
THIS IS A GENERATED/BUNDLED FILE BY ROLLUP
if you want to view the source visit the plugins github repository
*/

'use strict';

var obsidian = require('obsidian');
var fs = require('fs');
var path = require('path');

function _interopNamespace(e) {
    if (e && e.__esModule) return e;
    var n = Object.create(null);
    if (e) {
        Object.keys(e).forEach(function (k) {
            if (k !== 'default') {
                var d = Object.getOwnPropertyDescriptor(e, k);
                Object.defineProperty(n, k, d.get ? d : {
                    enumerable: true,
                    get: function () { return e[k]; }
                });
            }
        });
    }
    n["default"] = e;
    return Object.freeze(n);
}

var fs__namespace = /*#__PURE__*/_interopNamespace(fs);
var path__namespace = /*#__PURE__*/_interopNamespace(path);

/******************************************************************************
Copyright (c) Microsoft Corporation.

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
***************************************************************************** */
/* global Reflect, Promise, SuppressedError, Symbol, Iterator */

var extendStatics = function(d, b) {
    extendStatics = Object.setPrototypeOf ||
        ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
        function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
    return extendStatics(d, b);
};

function __extends(d, b) {
    if (typeof b !== "function" && b !== null)
        throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
    extendStatics(d, b);
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
}

function __awaiter(thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
}

function __generator(thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g = Object.create((typeof Iterator === "function" ? Iterator : Object).prototype);
    return g.next = verb(0), g["throw"] = verb(1), g["return"] = verb(2), typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
}

typeof SuppressedError === "function" ? SuppressedError : function (error, suppressed, message) {
    var e = new Error(message);
    return e.name = "SuppressedError", e.error = error, e.suppressed = suppressed, e;
};

var DEFAULT_SETTINGS = {
    linkPrefix: "",
    showFileEnding: false,
    linkFolder: false,
    embedFile: false
};
var SUPPORTED_EMBED_FILE_TYPES = [
    ".md",
    ".png",
    ".jpg",
    ".jpeg",
    ".gif",
    ".bmp",
    ".svg",
    ".mp3",
    ".webm",
    ".wav",
    ".m4a",
    ".ogg",
    ".3gp",
    ".flac",
    ".mp4",
    ".webm",
    ".ogv",
    ".pdf",
];

var FileLinkSettingTab = /** @class */ (function (_super) {
    __extends(FileLinkSettingTab, _super);
    function FileLinkSettingTab(app, plugin) {
        var _this = _super.call(this, app, plugin) || this;
        _this.plugin = plugin;
        return _this;
    }
    FileLinkSettingTab.prototype.display = function () {
        var _this = this;
        var containerEl = this.containerEl;
        containerEl.empty();
        containerEl.createEl("h2", { text: "Better File Link Settings" });
        new obsidian.Setting(containerEl)
            .setName("List style for multiple files")
            .setDesc("Specify the characters shown before every file link.")
            .addText(function (text) {
            return text
                .setPlaceholder("-")
                .setValue(_this.plugin.settings.linkPrefix)
                .onChange(function (value) { return __awaiter(_this, void 0, void 0, function () {
                return __generator(this, function (_a) {
                    switch (_a.label) {
                        case 0:
                            this.plugin.settings.linkPrefix = value;
                            return [4 /*yield*/, this.plugin.saveSettings()];
                        case 1:
                            _a.sent();
                            return [2 /*return*/];
                    }
                });
            }); });
        });
        new obsidian.Setting(containerEl)
            .setName("Show file extension")
            .setDesc("Will show file endings when activated.")
            .addToggle(function (toggle) {
            return toggle
                .setValue(_this.plugin.settings.showFileEnding)
                .onChange(function () { return __awaiter(_this, void 0, void 0, function () {
                return __generator(this, function (_a) {
                    switch (_a.label) {
                        case 0:
                            this.plugin.settings.showFileEnding = toggle.getValue();
                            return [4 /*yield*/, this.plugin.saveSettings()];
                        case 1:
                            _a.sent();
                            return [2 /*return*/];
                    }
                });
            }); });
        });
        new obsidian.Setting(containerEl)
            .setName("Embed file")
            .setDesc("Will copy the file to Obsidian and embed it in the note.")
            .addToggle(function (toggle) {
            return toggle.setValue(_this.plugin.settings.embedFile).onChange(function () { return __awaiter(_this, void 0, void 0, function () {
                return __generator(this, function (_a) {
                    switch (_a.label) {
                        case 0:
                            this.plugin.settings.embedFile = toggle.getValue();
                            return [4 /*yield*/, this.plugin.saveSettings()];
                        case 1:
                            _a.sent();
                            return [2 /*return*/];
                    }
                });
            }); });
        });
        new obsidian.Setting(containerEl)
            .setName("Link folder instead of file")
            .setDesc("Link will open the folder where the file is located instead of opening the file itself.")
            .addToggle(function (toggle) {
            return toggle.setValue(_this.plugin.settings.linkFolder).onChange(function () { return __awaiter(_this, void 0, void 0, function () {
                return __generator(this, function (_a) {
                    switch (_a.label) {
                        case 0:
                            this.plugin.settings.linkFolder = toggle.getValue();
                            return [4 /*yield*/, this.plugin.saveSettings()];
                        case 1:
                            _a.sent();
                            return [2 /*return*/];
                    }
                });
            }); });
        });
    };
    return FileLinkSettingTab;
}(obsidian.PluginSettingTab));

var FileEmbeder = /** @class */ (function () {
    function FileEmbeder(settings) {
        this.settings = settings;
    }
    FileEmbeder.prototype.getEmbedMarkdownLink = function (filePath) {
        var ext = this.getPathInformation(filePath).ext;
        if (!SUPPORTED_EMBED_FILE_TYPES.includes(ext)) {
            new obsidian.Notice("Files of this type are not supported for embedding in Obsidian.");
        }
        return "!" + this.getMarkdownLink(filePath, false);
    };
    FileEmbeder.prototype.copyFile = function (sourcePath, targetDir) {
        try {
            fs__namespace.mkdirSync(targetDir, { recursive: true });
            var filename = path__namespace.basename(sourcePath);
            var destPath = path__namespace.join(targetDir, filename);
            fs__namespace.copyFileSync(sourcePath, destPath);
            return destPath;
        }
        catch (err) {
            console.error("Copy failed:", err);
            throw new Error("File copy failed: ".concat(err.message));
        }
    };
    FileEmbeder.prototype.getPathInformation = function (filePath) {
        var normalizedPath = path__namespace.normalize(filePath);
        var parsedPath = path__namespace.parse(normalizedPath);
        return {
            fullPath: normalizedPath,
            dir: parsedPath.dir,
            filename: parsedPath.base,
            name: parsedPath.name,
            ext: parsedPath.ext
        };
    };
    FileEmbeder.prototype.getMarkdownLink = function (filePath, printPrefix) {
        var pathInfo = this.getPathInformation(filePath);
        var prefix = printPrefix ? this.settings.linkPrefix : "";
        var linkText = pathInfo.name;
        if (this.settings.linkFolder) {
            linkText = pathInfo.dir;
        }
        if (this.settings.showFileEnding) {
            linkText = pathInfo.filename;
        }
        var linkPath = this.settings.linkFolder
            ? pathInfo.dir
            : pathInfo.fullPath;
        return this.formatMarkdownLink(prefix, linkText, linkPath);
    };
    FileEmbeder.prototype.formatMarkdownLink = function (prefix, text, path) {
        var space = prefix && prefix !== "!" ? " " : "";
        return "".concat(prefix).concat(space, "[").concat(text, "](<file:///").concat(path, ">)\n");
    };
    return FileEmbeder;
}());

var FileLinkModal = /** @class */ (function (_super) {
    __extends(FileLinkModal, _super);
    function FileLinkModal(app, plugin) {
        var _this = _super.call(this, app) || this;
        _this.filePaths = [];
        _this.plugin = plugin;
        return _this;
    }
    FileLinkModal.prototype.onOpen = function () {
        return __awaiter(this, void 0, void 0, function () {
            var contentEl, mainContainer, fileSelectionSection, fileButton, checkboxContainer, createCheckboxGroup, checkboxEmbed, checkboxFileFolder, checkboxFileEnding, buttonContainer, submitButton;
            var _this = this;
            return __generator(this, function (_a) {
                contentEl = this.contentEl;
                mainContainer = contentEl.createEl("div", {
                    cls: "bfl-container"
                });
                fileSelectionSection = mainContainer.createEl("div", {
                    cls: "bfl-selection-section"
                });
                fileButton = fileSelectionSection.createEl("button", {
                    text: "Select files",
                    cls: "mod-cta"
                });
                this.selectedFilesDiv = fileSelectionSection.createEl("div", {
                    cls: "bfl-selected-files"
                });
                this.displaySelectedFiles([]);
                checkboxContainer = mainContainer.createEl("div", {
                    cls: "bfl-checkbox-container"
                });
                createCheckboxGroup = function (id, label, initialValue) {
                    var wrapper = checkboxContainer.createEl("div", {
                        cls: "bfl-checkbox-group"
                    });
                    var checkbox = wrapper.createEl("input", {
                        type: "checkbox",
                        attr: {
                            id: id,
                            style: "margin: 0;"
                        }
                    });
                    wrapper.createEl("label", {
                        text: label,
                        attr: {
                            "for": id,
                            style: "margin: 0; user-select: none;"
                        }
                    });
                    checkbox.checked = initialValue;
                    return checkbox;
                };
                checkboxEmbed = createCheckboxGroup("embed", "Embed file", this.plugin.settings.embedFile);
                checkboxFileFolder = createCheckboxGroup("file-folder", "Link folder", this.plugin.settings.linkFolder);
                checkboxFileEnding = createCheckboxGroup("file-ending", "Show file extension", this.plugin.settings.showFileEnding);
                buttonContainer = mainContainer.createEl("div", {
                    cls: "button-container",
                    attr: {
                        style: "margin-top: 5px;"
                    }
                });
                submitButton = buttonContainer.createEl("button", {
                    text: "Add file link",
                    cls: "mod-cta"
                });
                fileButton.addEventListener("click", function () { return __awaiter(_this, void 0, void 0, function () {
                    var d, result, error_1;
                    return __generator(this, function (_a) {
                        switch (_a.label) {
                            case 0:
                                d = require("electron").remote.dialog;
                                _a.label = 1;
                            case 1:
                                _a.trys.push([1, 3, , 4]);
                                return [4 /*yield*/, d.showOpenDialog({
                                        properties: ["openFile", "multiSelections"],
                                        filters: [{ name: "All Files", extensions: ["*"] }]
                                    })];
                            case 2:
                                result = _a.sent();
                                if (!result.canceled && result.filePaths.length > 0) {
                                    this.filePaths = result.filePaths;
                                    this.displaySelectedFiles(this.filePaths);
                                }
                                return [3 /*break*/, 4];
                            case 3:
                                error_1 = _a.sent();
                                new obsidian.Notice("Error selecting files: " + error_1.message);
                                return [3 /*break*/, 4];
                            case 4: return [2 /*return*/];
                        }
                    });
                }); });
                submitButton.addEventListener("click", function () {
                    if (_this.filePaths.length > 0) {
                        // Update settings
                        _this.plugin.settings.linkFolder = checkboxFileFolder.checked;
                        _this.plugin.settings.showFileEnding = checkboxFileEnding.checked;
                        _this.plugin.settings.embedFile = checkboxEmbed.checked;
                        var fe_1 = new FileEmbeder(_this.plugin.settings);
                        if (checkboxEmbed.checked) {
                            _this.filePaths.forEach(function (file) {
                                var embedMarkdownLink = fe_1.getEmbedMarkdownLink(file);
                                _this.addAtCursor(embedMarkdownLink);
                            });
                        }
                        else {
                            var linkString_1 = "";
                            _this.filePaths.forEach(function (file) {
                                linkString_1 += fe_1.getMarkdownLink(file, _this.filePaths.length > 1);
                            });
                            _this.addAtCursor(linkString_1);
                        }
                        _this.close();
                        new obsidian.Notice("Added ".concat(_this.filePaths.length, " file link(s)"));
                    }
                    else {
                        new obsidian.Notice("No files selected");
                    }
                });
                return [2 /*return*/];
            });
        });
    };
    FileLinkModal.prototype.displaySelectedFiles = function (files) {
        this.selectedFilesDiv.empty();
        if (files.length === 0) {
            this.selectedFilesDiv.createEl("p", {
                text: "No files selected",
                cls: "no-files-message",
                attr: {
                    style: "color: var(--text-muted); font-style: italic; margin: 0; padding: 8px;"
                }
            });
            return;
        }
        var fileList = this.selectedFilesDiv.createEl("ul", {
            cls: "selected-files-list",
            attr: {
                style: "list-style: none; padding: 0; margin: 0;"
            }
        });
        files.forEach(function (filePath) {
            var fileName = filePath.split(/[\\/]/).pop() || filePath;
            fileList.createEl("li", {
                text: fileName,
                cls: "selected-file-item",
                attr: {
                    style: "padding: 4px 8px; border-bottom: 1px solid var(--background-modifier-border);"
                }
            });
        });
    };
    FileLinkModal.prototype.addAtCursor = function (s) {
        var markdownView = this.app.workspace.getActiveViewOfType(obsidian.MarkdownView);
        if (markdownView) {
            var editor = markdownView.editor;
            var currentLine = editor.getCursor();
            editor.replaceRange(s, currentLine, currentLine);
        }
    };
    FileLinkModal.prototype.onClose = function () {
        var contentEl = this.contentEl;
        contentEl.empty();
    };
    return FileLinkModal;
}(obsidian.Modal));

var FileLink = /** @class */ (function (_super) {
    __extends(FileLink, _super);
    function FileLink() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    FileLink.prototype.onload = function () {
        return __awaiter(this, void 0, void 0, function () {
            var _this = this;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        console.log("loading plugin file-link");
                        return [4 /*yield*/, this.loadSettings()];
                    case 1:
                        _a.sent();
                        this.addSettingTab(new FileLinkSettingTab(this.app, this));
                        this.addCommand({
                            id: "add-file-link",
                            name: "Add File Link",
                            editorCallback: function () {
                                new FileLinkModal(_this.app, _this).open();
                            }
                        });
                        return [2 /*return*/];
                }
            });
        });
    };
    FileLink.prototype.onunload = function () {
        console.log("unloading plugin file-link");
    };
    FileLink.prototype.loadSettings = function () {
        return __awaiter(this, void 0, void 0, function () {
            var _a, _b, _c, _d;
            return __generator(this, function (_e) {
                switch (_e.label) {
                    case 0:
                        _a = this;
                        _c = (_b = Object).assign;
                        _d = [{}, DEFAULT_SETTINGS];
                        return [4 /*yield*/, this.loadData()];
                    case 1:
                        _a.settings = _c.apply(_b, _d.concat([_e.sent()]));
                        return [2 /*return*/];
                }
            });
        });
    };
    FileLink.prototype.saveSettings = function () {
        return __awaiter(this, void 0, void 0, function () {
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, this.saveData(this.settings)];
                    case 1:
                        _a.sent();
                        return [2 /*return*/];
                }
            });
        });
    };
    return FileLink;
}(obsidian.Plugin));

module.exports = FileLink;


/* nosourcemap */