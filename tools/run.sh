#!/bin/bash

# haxe -main org.zamedev.virtualbooks.Transliterator -neko run.n && neko run.n
haxe -main org.zamedev.virtualbooks.EpubToHtmlConverter -neko run.n && neko run.n
