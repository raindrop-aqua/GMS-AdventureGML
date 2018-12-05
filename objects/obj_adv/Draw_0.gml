/// @desc 描画

// 背景を描画
var lay_id = layer_get_id("Background");
var bg_id = layer_background_get_id(lay_id);
layer_background_sprite(bg_id, background);

// キャラクターを描画
draw_sprite(character, 0, 0, 0);

// メッセージウィンドウを描画
draw_sprite(spr_window, 0, 0, 320);

// メッセージを描画
draw_set_font(fnt_adv);
draw_set_color(c_white);
draw_text(16, 320 + 48, message);
