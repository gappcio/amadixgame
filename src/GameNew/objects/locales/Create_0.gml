text = file_text_open_read(working_directory + "langs.json");
root = json_decode(text);
global.lang_map = ds_map_find_value(root, "English");

global.lang = "English";