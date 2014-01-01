package org.zamedev.lib;

import sys.io.File;

using Lambda;

class ZipReaderExt {
	var entryMap:Map<String,haxe.zip.Entry>;

	private function new(i:haxe.io.Input) {
		entryMap = new Map<String, haxe.zip.Entry>();

		(new ZipReader(i)).read().iter(function(v) {
			entryMap[v.fileName] = v;
		});
	}

	public static function fromPath(path:String) {
		return new ZipReaderExt(File.read(path, true));
	}

	public static function fromInput(i:haxe.io.Input) {
		return new ZipReaderExt(i);
	}

	public function entryAsBinary(entryName:String):Null<haxe.io.Bytes> {
		return haxe.zip.Reader.unzip(entryMap[entryName]);
	}

	public function entryAsString(entryName:String):String {
		return Std.string(haxe.zip.Reader.unzip(entryMap[entryName]));
	}
}
