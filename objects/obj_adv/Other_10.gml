/// @desc スクリプトの実行

// １０．スクリプト解析ループの開始
while (true) {
	// １１．ファイル終端チェック
	if (file_text_eof(handle_script)) {
		instance_destroy();
		break;
	}
	
	// １．1行読み込み
	var line = file_text_read_string(handle_script);
	// ２．コマンド文字取得
	var index = string_pos(",", line);
	var cmd = string_copy(line, 0, index - 1);
	// ３．コマンド以降の文字を切り出し
	var str = string_copy(line, index + 1, 65535);

	// ４．配列を用意
	var params;
	params[0] = 0;	// 配列初期化
	var idx = 0;	// 配列のインデックス

	while (true) {
		index = string_pos(",", str);
	
		if (index == 0) {
			// ５．次のパラメータがないので終了
			params[idx] = str;
			break;
		} else {
			params[idx] = string_copy(line, 0, index - 1);
		}
		idx++;
		// ７．次のパラメータを取得
		str = string_copy(str, index, 65535);
	}

	// １２．スクリプト実行終了判定
	var isExit = false;
	
	// コマンドを実行する
	switch (cmd) {
		case "msg":	// メッセージ
			// ８．テキスト表示
			message = params[0];
			isExit = true;
			break;
		case "bg":	// 背景
			sprite_delete(background);
			var filename = "bg" + params[0] + ".jpg";
			background = sprite_add(filename, 1, false, false, 0, 0);
			break;
		case "ch":	// キャラクター
			sprite_delete(character);
			var filename = "ch" + params[0] + ".png";
			character = sprite_add(filename, 1, false, false, 0, 0);
			break;
	}
	// ９．次の行に進める
	file_text_readln(handle_script);
	
	if (isExit) {
		// ゲームに制御を返す
		break;
	}
}