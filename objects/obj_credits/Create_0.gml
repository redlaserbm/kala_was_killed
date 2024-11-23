/// @description Insert description here
// You can write your code in this editor

depth = -15001;

line_sep = 0.5*global.textbox.line_sep;

indent = line_sep + string_height("lazy");

// Elements of credits are structs with two components:
// A label of component to which the credit is being associated with
// A list of contributors to that portion of the project

credits = [];

array_push(credits, {label: "Concept", contributors: ["redlaserbm", "brutsie"]});
array_push(credits, {label: "Programming, Writing, & Music", contributors: ["redlaserbm"]});
array_push(credits, {label: "Character Design", contributors: ["S.K.E.T.C.H", "TemmieArson", "Kalanit Saidon", "redlaserbm"]});
array_push(credits, {label: "Character Art", contributors: ["S.K.E.T.C.H", "TemmieArson"]});
array_push(credits, {label: "Background Art", contributors: ["TemmieArson"]});
array_push(credits, {label: "Title Screen Art", contributors: ["Kalanit Saidon"]});
array_push(credits, {label: "Playtesting", contributors: ["brutsie", "redlaserbm"]});
array_push(credits, {label: "Starring the likenesses of", contributors: ["TemmieArson", "redlaserbm", "S.K.E.T.C.H.", "Kalanit Saidon", "Jakkop"]});
array_push(credits, {label: "Thanks for playing!", contributors: []});
scroll_speed = 0.5;
y_start = 480;