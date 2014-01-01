package org.zamedev.lib;

class Utf8ExtInternal {
	public static function fillUpperToLowerMap(map:Map<Int,Int>):Void {
		map[0x0041] = 0x0061;
		map[0x0042] = 0x0062;
		map[0x0043] = 0x0063;
		map[0x0044] = 0x0064;
		map[0x0045] = 0x0065;
		map[0x0046] = 0x0066;
		map[0x0047] = 0x0067;
		map[0x0048] = 0x0068;
		map[0x0049] = 0x0069;
		map[0x004A] = 0x006A;
		map[0x004B] = 0x006B;
		map[0x004C] = 0x006C;
		map[0x004D] = 0x006D;
		map[0x004E] = 0x006E;
		map[0x004F] = 0x006F;
		map[0x0050] = 0x0070;
		map[0x0051] = 0x0071;
		map[0x0052] = 0x0072;
		map[0x0053] = 0x0073;
		map[0x0054] = 0x0074;
		map[0x0055] = 0x0075;
		map[0x0056] = 0x0076;
		map[0x0057] = 0x0077;
		map[0x0058] = 0x0078;
		map[0x0059] = 0x0079;
		map[0x005A] = 0x007A;
		map[0x00B5] = 0x03BC;
		map[0x00C0] = 0x00E0;
		map[0x00C1] = 0x00E1;
		map[0x00C2] = 0x00E2;
		map[0x00C3] = 0x00E3;
		map[0x00C4] = 0x00E4;
		map[0x00C5] = 0x00E5;
		map[0x00C6] = 0x00E6;
		map[0x00C7] = 0x00E7;
		map[0x00C8] = 0x00E8;
		map[0x00C9] = 0x00E9;
		map[0x00CA] = 0x00EA;
		map[0x00CB] = 0x00EB;
		map[0x00CC] = 0x00EC;
		map[0x00CD] = 0x00ED;
		map[0x00CE] = 0x00EE;
		map[0x00CF] = 0x00EF;
		map[0x00D0] = 0x00F0;
		map[0x00D1] = 0x00F1;
		map[0x00D2] = 0x00F2;
		map[0x00D3] = 0x00F3;
		map[0x00D4] = 0x00F4;
		map[0x00D5] = 0x00F5;
		map[0x00D6] = 0x00F6;
		map[0x00D8] = 0x00F8;
		map[0x00D9] = 0x00F9;
		map[0x00DA] = 0x00FA;
		map[0x00DB] = 0x00FB;
		map[0x00DC] = 0x00FC;
		map[0x00DD] = 0x00FD;
		map[0x00DE] = 0x00FE;
		map[0x0100] = 0x0101;
		map[0x0102] = 0x0103;
		map[0x0104] = 0x0105;
		map[0x0106] = 0x0107;
		map[0x0108] = 0x0109;
		map[0x010A] = 0x010B;
		map[0x010C] = 0x010D;
		map[0x010E] = 0x010F;
		map[0x0110] = 0x0111;
		map[0x0112] = 0x0113;
		map[0x0114] = 0x0115;
		map[0x0116] = 0x0117;
		map[0x0118] = 0x0119;
		map[0x011A] = 0x011B;
		map[0x011C] = 0x011D;
		map[0x011E] = 0x011F;
		map[0x0120] = 0x0121;
		map[0x0122] = 0x0123;
		map[0x0124] = 0x0125;
		map[0x0126] = 0x0127;
		map[0x0128] = 0x0129;
		map[0x012A] = 0x012B;
		map[0x012C] = 0x012D;
		map[0x012E] = 0x012F;
		map[0x0132] = 0x0133;
		map[0x0134] = 0x0135;
		map[0x0136] = 0x0137;
		map[0x0139] = 0x013A;
		map[0x013B] = 0x013C;
		map[0x013D] = 0x013E;
		map[0x013F] = 0x0140;
		map[0x0141] = 0x0142;
		map[0x0143] = 0x0144;
		map[0x0145] = 0x0146;
		map[0x0147] = 0x0148;
		map[0x014A] = 0x014B;
		map[0x014C] = 0x014D;
		map[0x014E] = 0x014F;
		map[0x0150] = 0x0151;
		map[0x0152] = 0x0153;
		map[0x0154] = 0x0155;
		map[0x0156] = 0x0157;
		map[0x0158] = 0x0159;
		map[0x015A] = 0x015B;
		map[0x015C] = 0x015D;
		map[0x015E] = 0x015F;
		map[0x0160] = 0x0161;
		map[0x0162] = 0x0163;
		map[0x0164] = 0x0165;
		map[0x0166] = 0x0167;
		map[0x0168] = 0x0169;
		map[0x016A] = 0x016B;
		map[0x016C] = 0x016D;
		map[0x016E] = 0x016F;
		map[0x0170] = 0x0171;
		map[0x0172] = 0x0173;
		map[0x0174] = 0x0175;
		map[0x0176] = 0x0177;
		map[0x0178] = 0x00FF;
		map[0x0179] = 0x017A;
		map[0x017B] = 0x017C;
		map[0x017D] = 0x017E;
		map[0x017F] = 0x0073;
		map[0x0181] = 0x0253;
		map[0x0182] = 0x0183;
		map[0x0184] = 0x0185;
		map[0x0186] = 0x0254;
		map[0x0187] = 0x0188;
		map[0x0189] = 0x0256;
		map[0x018A] = 0x0257;
		map[0x018B] = 0x018C;
		map[0x018E] = 0x01DD;
		map[0x018F] = 0x0259;
		map[0x0190] = 0x025B;
		map[0x0191] = 0x0192;
		map[0x0193] = 0x0260;
		map[0x0194] = 0x0263;
		map[0x0196] = 0x0269;
		map[0x0197] = 0x0268;
		map[0x0198] = 0x0199;
		map[0x019C] = 0x026F;
		map[0x019D] = 0x0272;
		map[0x019F] = 0x0275;
		map[0x01A0] = 0x01A1;
		map[0x01A2] = 0x01A3;
		map[0x01A4] = 0x01A5;
		map[0x01A6] = 0x0280;
		map[0x01A7] = 0x01A8;
		map[0x01A9] = 0x0283;
		map[0x01AC] = 0x01AD;
		map[0x01AE] = 0x0288;
		map[0x01AF] = 0x01B0;
		map[0x01B1] = 0x028A;
		map[0x01B2] = 0x028B;
		map[0x01B3] = 0x01B4;
		map[0x01B5] = 0x01B6;
		map[0x01B7] = 0x0292;
		map[0x01B8] = 0x01B9;
		map[0x01BC] = 0x01BD;
		map[0x01C4] = 0x01C6;
		map[0x01C5] = 0x01C6;
		map[0x01C7] = 0x01C9;
		map[0x01C8] = 0x01C9;
		map[0x01CA] = 0x01CC;
		map[0x01CB] = 0x01CC;
		map[0x01CD] = 0x01CE;
		map[0x01CF] = 0x01D0;
		map[0x01D1] = 0x01D2;
		map[0x01D3] = 0x01D4;
		map[0x01D5] = 0x01D6;
		map[0x01D7] = 0x01D8;
		map[0x01D9] = 0x01DA;
		map[0x01DB] = 0x01DC;
		map[0x01DE] = 0x01DF;
		map[0x01E0] = 0x01E1;
		map[0x01E2] = 0x01E3;
		map[0x01E4] = 0x01E5;
		map[0x01E6] = 0x01E7;
		map[0x01E8] = 0x01E9;
		map[0x01EA] = 0x01EB;
		map[0x01EC] = 0x01ED;
		map[0x01EE] = 0x01EF;
		map[0x01F1] = 0x01F3;
		map[0x01F2] = 0x01F3;
		map[0x01F4] = 0x01F5;
		map[0x01F6] = 0x0195;
		map[0x01F7] = 0x01BF;
		map[0x01F8] = 0x01F9;
		map[0x01FA] = 0x01FB;
		map[0x01FC] = 0x01FD;
		map[0x01FE] = 0x01FF;
		map[0x0200] = 0x0201;
		map[0x0202] = 0x0203;
		map[0x0204] = 0x0205;
		map[0x0206] = 0x0207;
		map[0x0208] = 0x0209;
		map[0x020A] = 0x020B;
		map[0x020C] = 0x020D;
		map[0x020E] = 0x020F;
		map[0x0210] = 0x0211;
		map[0x0212] = 0x0213;
		map[0x0214] = 0x0215;
		map[0x0216] = 0x0217;
		map[0x0218] = 0x0219;
		map[0x021A] = 0x021B;
		map[0x021C] = 0x021D;
		map[0x021E] = 0x021F;
		map[0x0220] = 0x019E;
		map[0x0222] = 0x0223;
		map[0x0224] = 0x0225;
		map[0x0226] = 0x0227;
		map[0x0228] = 0x0229;
		map[0x022A] = 0x022B;
		map[0x022C] = 0x022D;
		map[0x022E] = 0x022F;
		map[0x0230] = 0x0231;
		map[0x0232] = 0x0233;
		map[0x023A] = 0x2C65;
		map[0x023B] = 0x023C;
		map[0x023D] = 0x019A;
		map[0x023E] = 0x2C66;
		map[0x0241] = 0x0242;
		map[0x0243] = 0x0180;
		map[0x0244] = 0x0289;
		map[0x0245] = 0x028C;
		map[0x0246] = 0x0247;
		map[0x0248] = 0x0249;
		map[0x024A] = 0x024B;
		map[0x024C] = 0x024D;
		map[0x024E] = 0x024F;
		map[0x0345] = 0x03B9;
		map[0x0370] = 0x0371;
		map[0x0372] = 0x0373;
		map[0x0376] = 0x0377;
		map[0x0386] = 0x03AC;
		map[0x0388] = 0x03AD;
		map[0x0389] = 0x03AE;
		map[0x038A] = 0x03AF;
		map[0x038C] = 0x03CC;
		map[0x038E] = 0x03CD;
		map[0x038F] = 0x03CE;
		map[0x0391] = 0x03B1;
		map[0x0392] = 0x03B2;
		map[0x0393] = 0x03B3;
		map[0x0394] = 0x03B4;
		map[0x0395] = 0x03B5;
		map[0x0396] = 0x03B6;
		map[0x0397] = 0x03B7;
		map[0x0398] = 0x03B8;
		map[0x0399] = 0x03B9;
		map[0x039A] = 0x03BA;
		map[0x039B] = 0x03BB;
		map[0x039C] = 0x03BC;
		map[0x039D] = 0x03BD;
		map[0x039E] = 0x03BE;
		map[0x039F] = 0x03BF;
		map[0x03A0] = 0x03C0;
		map[0x03A1] = 0x03C1;
		map[0x03A3] = 0x03C3;
		map[0x03A4] = 0x03C4;
		map[0x03A5] = 0x03C5;
		map[0x03A6] = 0x03C6;
		map[0x03A7] = 0x03C7;
		map[0x03A8] = 0x03C8;
		map[0x03A9] = 0x03C9;
		map[0x03AA] = 0x03CA;
		map[0x03AB] = 0x03CB;
		map[0x03C2] = 0x03C3;
		map[0x03CF] = 0x03D7;
		map[0x03D0] = 0x03B2;
		map[0x03D1] = 0x03B8;
		map[0x03D5] = 0x03C6;
		map[0x03D6] = 0x03C0;
		map[0x03D8] = 0x03D9;
		map[0x03DA] = 0x03DB;
		map[0x03DC] = 0x03DD;
		map[0x03DE] = 0x03DF;
		map[0x03E0] = 0x03E1;
		map[0x03E2] = 0x03E3;
		map[0x03E4] = 0x03E5;
		map[0x03E6] = 0x03E7;
		map[0x03E8] = 0x03E9;
		map[0x03EA] = 0x03EB;
		map[0x03EC] = 0x03ED;
		map[0x03EE] = 0x03EF;
		map[0x03F0] = 0x03BA;
		map[0x03F1] = 0x03C1;
		map[0x03F4] = 0x03B8;
		map[0x03F5] = 0x03B5;
		map[0x03F7] = 0x03F8;
		map[0x03F9] = 0x03F2;
		map[0x03FA] = 0x03FB;
		map[0x03FD] = 0x037B;
		map[0x03FE] = 0x037C;
		map[0x03FF] = 0x037D;
		map[0x0400] = 0x0450;
		map[0x0401] = 0x0451;
		map[0x0402] = 0x0452;
		map[0x0403] = 0x0453;
		map[0x0404] = 0x0454;
		map[0x0405] = 0x0455;
		map[0x0406] = 0x0456;
		map[0x0407] = 0x0457;
		map[0x0408] = 0x0458;
		map[0x0409] = 0x0459;
		map[0x040A] = 0x045A;
		map[0x040B] = 0x045B;
		map[0x040C] = 0x045C;
		map[0x040D] = 0x045D;
		map[0x040E] = 0x045E;
		map[0x040F] = 0x045F;
		map[0x0410] = 0x0430;
		map[0x0411] = 0x0431;
		map[0x0412] = 0x0432;
		map[0x0413] = 0x0433;
		map[0x0414] = 0x0434;
		map[0x0415] = 0x0435;
		map[0x0416] = 0x0436;
		map[0x0417] = 0x0437;
		map[0x0418] = 0x0438;
		map[0x0419] = 0x0439;
		map[0x041A] = 0x043A;
		map[0x041B] = 0x043B;
		map[0x041C] = 0x043C;
		map[0x041D] = 0x043D;
		map[0x041E] = 0x043E;
		map[0x041F] = 0x043F;
		map[0x0420] = 0x0440;
		map[0x0421] = 0x0441;
		map[0x0422] = 0x0442;
		map[0x0423] = 0x0443;
		map[0x0424] = 0x0444;
		map[0x0425] = 0x0445;
		map[0x0426] = 0x0446;
		map[0x0427] = 0x0447;
		map[0x0428] = 0x0448;
		map[0x0429] = 0x0449;
		map[0x042A] = 0x044A;
		map[0x042B] = 0x044B;
		map[0x042C] = 0x044C;
		map[0x042D] = 0x044D;
		map[0x042E] = 0x044E;
		map[0x042F] = 0x044F;
		map[0x0460] = 0x0461;
		map[0x0462] = 0x0463;
		map[0x0464] = 0x0465;
		map[0x0466] = 0x0467;
		map[0x0468] = 0x0469;
		map[0x046A] = 0x046B;
		map[0x046C] = 0x046D;
		map[0x046E] = 0x046F;
		map[0x0470] = 0x0471;
		map[0x0472] = 0x0473;
		map[0x0474] = 0x0475;
		map[0x0476] = 0x0477;
		map[0x0478] = 0x0479;
		map[0x047A] = 0x047B;
		map[0x047C] = 0x047D;
		map[0x047E] = 0x047F;
		map[0x0480] = 0x0481;
		map[0x048A] = 0x048B;
		map[0x048C] = 0x048D;
		map[0x048E] = 0x048F;
		map[0x0490] = 0x0491;
		map[0x0492] = 0x0493;
		map[0x0494] = 0x0495;
		map[0x0496] = 0x0497;
		map[0x0498] = 0x0499;
		map[0x049A] = 0x049B;
		map[0x049C] = 0x049D;
		map[0x049E] = 0x049F;
		map[0x04A0] = 0x04A1;
		map[0x04A2] = 0x04A3;
		map[0x04A4] = 0x04A5;
		map[0x04A6] = 0x04A7;
		map[0x04A8] = 0x04A9;
		map[0x04AA] = 0x04AB;
		map[0x04AC] = 0x04AD;
		map[0x04AE] = 0x04AF;
		map[0x04B0] = 0x04B1;
		map[0x04B2] = 0x04B3;
		map[0x04B4] = 0x04B5;
		map[0x04B6] = 0x04B7;
		map[0x04B8] = 0x04B9;
		map[0x04BA] = 0x04BB;
		map[0x04BC] = 0x04BD;
		map[0x04BE] = 0x04BF;
		map[0x04C0] = 0x04CF;
		map[0x04C1] = 0x04C2;
		map[0x04C3] = 0x04C4;
		map[0x04C5] = 0x04C6;
		map[0x04C7] = 0x04C8;
		map[0x04C9] = 0x04CA;
		map[0x04CB] = 0x04CC;
		map[0x04CD] = 0x04CE;
		map[0x04D0] = 0x04D1;
		map[0x04D2] = 0x04D3;
		map[0x04D4] = 0x04D5;
		map[0x04D6] = 0x04D7;
		map[0x04D8] = 0x04D9;
		map[0x04DA] = 0x04DB;
		map[0x04DC] = 0x04DD;
		map[0x04DE] = 0x04DF;
		map[0x04E0] = 0x04E1;
		map[0x04E2] = 0x04E3;
		map[0x04E4] = 0x04E5;
		map[0x04E6] = 0x04E7;
		map[0x04E8] = 0x04E9;
		map[0x04EA] = 0x04EB;
		map[0x04EC] = 0x04ED;
		map[0x04EE] = 0x04EF;
		map[0x04F0] = 0x04F1;
		map[0x04F2] = 0x04F3;
		map[0x04F4] = 0x04F5;
		map[0x04F6] = 0x04F7;
		map[0x04F8] = 0x04F9;
		map[0x04FA] = 0x04FB;
		map[0x04FC] = 0x04FD;
		map[0x04FE] = 0x04FF;
		map[0x0500] = 0x0501;
		map[0x0502] = 0x0503;
		map[0x0504] = 0x0505;
		map[0x0506] = 0x0507;
		map[0x0508] = 0x0509;
		map[0x050A] = 0x050B;
		map[0x050C] = 0x050D;
		map[0x050E] = 0x050F;
		map[0x0510] = 0x0511;
		map[0x0512] = 0x0513;
		map[0x0514] = 0x0515;
		map[0x0516] = 0x0517;
		map[0x0518] = 0x0519;
		map[0x051A] = 0x051B;
		map[0x051C] = 0x051D;
		map[0x051E] = 0x051F;
		map[0x0520] = 0x0521;
		map[0x0522] = 0x0523;
		map[0x0524] = 0x0525;
		map[0x0526] = 0x0527;
		map[0x0531] = 0x0561;
		map[0x0532] = 0x0562;
		map[0x0533] = 0x0563;
		map[0x0534] = 0x0564;
		map[0x0535] = 0x0565;
		map[0x0536] = 0x0566;
		map[0x0537] = 0x0567;
		map[0x0538] = 0x0568;
		map[0x0539] = 0x0569;
		map[0x053A] = 0x056A;
		map[0x053B] = 0x056B;
		map[0x053C] = 0x056C;
		map[0x053D] = 0x056D;
		map[0x053E] = 0x056E;
		map[0x053F] = 0x056F;
		map[0x0540] = 0x0570;
		map[0x0541] = 0x0571;
		map[0x0542] = 0x0572;
		map[0x0543] = 0x0573;
		map[0x0544] = 0x0574;
		map[0x0545] = 0x0575;
		map[0x0546] = 0x0576;
		map[0x0547] = 0x0577;
		map[0x0548] = 0x0578;
		map[0x0549] = 0x0579;
		map[0x054A] = 0x057A;
		map[0x054B] = 0x057B;
		map[0x054C] = 0x057C;
		map[0x054D] = 0x057D;
		map[0x054E] = 0x057E;
		map[0x054F] = 0x057F;
		map[0x0550] = 0x0580;
		map[0x0551] = 0x0581;
		map[0x0552] = 0x0582;
		map[0x0553] = 0x0583;
		map[0x0554] = 0x0584;
		map[0x0555] = 0x0585;
		map[0x0556] = 0x0586;
		map[0x10A0] = 0x2D00;
		map[0x10A1] = 0x2D01;
		map[0x10A2] = 0x2D02;
		map[0x10A3] = 0x2D03;
		map[0x10A4] = 0x2D04;
		map[0x10A5] = 0x2D05;
		map[0x10A6] = 0x2D06;
		map[0x10A7] = 0x2D07;
		map[0x10A8] = 0x2D08;
		map[0x10A9] = 0x2D09;
		map[0x10AA] = 0x2D0A;
		map[0x10AB] = 0x2D0B;
		map[0x10AC] = 0x2D0C;
		map[0x10AD] = 0x2D0D;
		map[0x10AE] = 0x2D0E;
		map[0x10AF] = 0x2D0F;
		map[0x10B0] = 0x2D10;
		map[0x10B1] = 0x2D11;
		map[0x10B2] = 0x2D12;
		map[0x10B3] = 0x2D13;
		map[0x10B4] = 0x2D14;
		map[0x10B5] = 0x2D15;
		map[0x10B6] = 0x2D16;
		map[0x10B7] = 0x2D17;
		map[0x10B8] = 0x2D18;
		map[0x10B9] = 0x2D19;
		map[0x10BA] = 0x2D1A;
		map[0x10BB] = 0x2D1B;
		map[0x10BC] = 0x2D1C;
		map[0x10BD] = 0x2D1D;
		map[0x10BE] = 0x2D1E;
		map[0x10BF] = 0x2D1F;
		map[0x10C0] = 0x2D20;
		map[0x10C1] = 0x2D21;
		map[0x10C2] = 0x2D22;
		map[0x10C3] = 0x2D23;
		map[0x10C4] = 0x2D24;
		map[0x10C5] = 0x2D25;
		map[0x10C7] = 0x2D27;
		map[0x10CD] = 0x2D2D;
		map[0x1E00] = 0x1E01;
		map[0x1E02] = 0x1E03;
		map[0x1E04] = 0x1E05;
		map[0x1E06] = 0x1E07;
		map[0x1E08] = 0x1E09;
		map[0x1E0A] = 0x1E0B;
		map[0x1E0C] = 0x1E0D;
		map[0x1E0E] = 0x1E0F;
		map[0x1E10] = 0x1E11;
		map[0x1E12] = 0x1E13;
		map[0x1E14] = 0x1E15;
		map[0x1E16] = 0x1E17;
		map[0x1E18] = 0x1E19;
		map[0x1E1A] = 0x1E1B;
		map[0x1E1C] = 0x1E1D;
		map[0x1E1E] = 0x1E1F;
		map[0x1E20] = 0x1E21;
		map[0x1E22] = 0x1E23;
		map[0x1E24] = 0x1E25;
		map[0x1E26] = 0x1E27;
		map[0x1E28] = 0x1E29;
		map[0x1E2A] = 0x1E2B;
		map[0x1E2C] = 0x1E2D;
		map[0x1E2E] = 0x1E2F;
		map[0x1E30] = 0x1E31;
		map[0x1E32] = 0x1E33;
		map[0x1E34] = 0x1E35;
		map[0x1E36] = 0x1E37;
		map[0x1E38] = 0x1E39;
		map[0x1E3A] = 0x1E3B;
		map[0x1E3C] = 0x1E3D;
		map[0x1E3E] = 0x1E3F;
		map[0x1E40] = 0x1E41;
		map[0x1E42] = 0x1E43;
		map[0x1E44] = 0x1E45;
		map[0x1E46] = 0x1E47;
		map[0x1E48] = 0x1E49;
		map[0x1E4A] = 0x1E4B;
		map[0x1E4C] = 0x1E4D;
		map[0x1E4E] = 0x1E4F;
		map[0x1E50] = 0x1E51;
		map[0x1E52] = 0x1E53;
		map[0x1E54] = 0x1E55;
		map[0x1E56] = 0x1E57;
		map[0x1E58] = 0x1E59;
		map[0x1E5A] = 0x1E5B;
		map[0x1E5C] = 0x1E5D;
		map[0x1E5E] = 0x1E5F;
		map[0x1E60] = 0x1E61;
		map[0x1E62] = 0x1E63;
		map[0x1E64] = 0x1E65;
		map[0x1E66] = 0x1E67;
		map[0x1E68] = 0x1E69;
		map[0x1E6A] = 0x1E6B;
		map[0x1E6C] = 0x1E6D;
		map[0x1E6E] = 0x1E6F;
		map[0x1E70] = 0x1E71;
		map[0x1E72] = 0x1E73;
		map[0x1E74] = 0x1E75;
		map[0x1E76] = 0x1E77;
		map[0x1E78] = 0x1E79;
		map[0x1E7A] = 0x1E7B;
		map[0x1E7C] = 0x1E7D;
		map[0x1E7E] = 0x1E7F;
		map[0x1E80] = 0x1E81;
		map[0x1E82] = 0x1E83;
		map[0x1E84] = 0x1E85;
		map[0x1E86] = 0x1E87;
		map[0x1E88] = 0x1E89;
		map[0x1E8A] = 0x1E8B;
		map[0x1E8C] = 0x1E8D;
		map[0x1E8E] = 0x1E8F;
		map[0x1E90] = 0x1E91;
		map[0x1E92] = 0x1E93;
		map[0x1E94] = 0x1E95;
		map[0x1E9B] = 0x1E61;
		map[0x1E9E] = 0x00DF;
		map[0x1EA0] = 0x1EA1;
		map[0x1EA2] = 0x1EA3;
		map[0x1EA4] = 0x1EA5;
		map[0x1EA6] = 0x1EA7;
		map[0x1EA8] = 0x1EA9;
		map[0x1EAA] = 0x1EAB;
		map[0x1EAC] = 0x1EAD;
		map[0x1EAE] = 0x1EAF;
		map[0x1EB0] = 0x1EB1;
		map[0x1EB2] = 0x1EB3;
		map[0x1EB4] = 0x1EB5;
		map[0x1EB6] = 0x1EB7;
		map[0x1EB8] = 0x1EB9;
		map[0x1EBA] = 0x1EBB;
		map[0x1EBC] = 0x1EBD;
		map[0x1EBE] = 0x1EBF;
		map[0x1EC0] = 0x1EC1;
		map[0x1EC2] = 0x1EC3;
		map[0x1EC4] = 0x1EC5;
		map[0x1EC6] = 0x1EC7;
		map[0x1EC8] = 0x1EC9;
		map[0x1ECA] = 0x1ECB;
		map[0x1ECC] = 0x1ECD;
		map[0x1ECE] = 0x1ECF;
		map[0x1ED0] = 0x1ED1;
		map[0x1ED2] = 0x1ED3;
		map[0x1ED4] = 0x1ED5;
		map[0x1ED6] = 0x1ED7;
		map[0x1ED8] = 0x1ED9;
		map[0x1EDA] = 0x1EDB;
		map[0x1EDC] = 0x1EDD;
		map[0x1EDE] = 0x1EDF;
		map[0x1EE0] = 0x1EE1;
		map[0x1EE2] = 0x1EE3;
		map[0x1EE4] = 0x1EE5;
		map[0x1EE6] = 0x1EE7;
		map[0x1EE8] = 0x1EE9;
		map[0x1EEA] = 0x1EEB;
		map[0x1EEC] = 0x1EED;
		map[0x1EEE] = 0x1EEF;
		map[0x1EF0] = 0x1EF1;
		map[0x1EF2] = 0x1EF3;
		map[0x1EF4] = 0x1EF5;
		map[0x1EF6] = 0x1EF7;
		map[0x1EF8] = 0x1EF9;
		map[0x1EFA] = 0x1EFB;
		map[0x1EFC] = 0x1EFD;
		map[0x1EFE] = 0x1EFF;
		map[0x1F08] = 0x1F00;
		map[0x1F09] = 0x1F01;
		map[0x1F0A] = 0x1F02;
		map[0x1F0B] = 0x1F03;
		map[0x1F0C] = 0x1F04;
		map[0x1F0D] = 0x1F05;
		map[0x1F0E] = 0x1F06;
		map[0x1F0F] = 0x1F07;
		map[0x1F18] = 0x1F10;
		map[0x1F19] = 0x1F11;
		map[0x1F1A] = 0x1F12;
		map[0x1F1B] = 0x1F13;
		map[0x1F1C] = 0x1F14;
		map[0x1F1D] = 0x1F15;
		map[0x1F28] = 0x1F20;
		map[0x1F29] = 0x1F21;
		map[0x1F2A] = 0x1F22;
		map[0x1F2B] = 0x1F23;
		map[0x1F2C] = 0x1F24;
		map[0x1F2D] = 0x1F25;
		map[0x1F2E] = 0x1F26;
		map[0x1F2F] = 0x1F27;
		map[0x1F38] = 0x1F30;
		map[0x1F39] = 0x1F31;
		map[0x1F3A] = 0x1F32;
		map[0x1F3B] = 0x1F33;
		map[0x1F3C] = 0x1F34;
		map[0x1F3D] = 0x1F35;
		map[0x1F3E] = 0x1F36;
		map[0x1F3F] = 0x1F37;
		map[0x1F48] = 0x1F40;
		map[0x1F49] = 0x1F41;
		map[0x1F4A] = 0x1F42;
		map[0x1F4B] = 0x1F43;
		map[0x1F4C] = 0x1F44;
		map[0x1F4D] = 0x1F45;
		map[0x1F59] = 0x1F51;
		map[0x1F5B] = 0x1F53;
		map[0x1F5D] = 0x1F55;
		map[0x1F5F] = 0x1F57;
		map[0x1F68] = 0x1F60;
		map[0x1F69] = 0x1F61;
		map[0x1F6A] = 0x1F62;
		map[0x1F6B] = 0x1F63;
		map[0x1F6C] = 0x1F64;
		map[0x1F6D] = 0x1F65;
		map[0x1F6E] = 0x1F66;
		map[0x1F6F] = 0x1F67;
		map[0x1F88] = 0x1F80;
		map[0x1F89] = 0x1F81;
		map[0x1F8A] = 0x1F82;
		map[0x1F8B] = 0x1F83;
		map[0x1F8C] = 0x1F84;
		map[0x1F8D] = 0x1F85;
		map[0x1F8E] = 0x1F86;
		map[0x1F8F] = 0x1F87;
		map[0x1F98] = 0x1F90;
		map[0x1F99] = 0x1F91;
		map[0x1F9A] = 0x1F92;
		map[0x1F9B] = 0x1F93;
		map[0x1F9C] = 0x1F94;
		map[0x1F9D] = 0x1F95;
		map[0x1F9E] = 0x1F96;
		map[0x1F9F] = 0x1F97;
		map[0x1FA8] = 0x1FA0;
		map[0x1FA9] = 0x1FA1;
		map[0x1FAA] = 0x1FA2;
		map[0x1FAB] = 0x1FA3;
		map[0x1FAC] = 0x1FA4;
		map[0x1FAD] = 0x1FA5;
		map[0x1FAE] = 0x1FA6;
		map[0x1FAF] = 0x1FA7;
		map[0x1FB8] = 0x1FB0;
		map[0x1FB9] = 0x1FB1;
		map[0x1FBA] = 0x1F70;
		map[0x1FBB] = 0x1F71;
		map[0x1FBC] = 0x1FB3;
		map[0x1FBE] = 0x03B9;
		map[0x1FC8] = 0x1F72;
		map[0x1FC9] = 0x1F73;
		map[0x1FCA] = 0x1F74;
		map[0x1FCB] = 0x1F75;
		map[0x1FCC] = 0x1FC3;
		map[0x1FD8] = 0x1FD0;
		map[0x1FD9] = 0x1FD1;
		map[0x1FDA] = 0x1F76;
		map[0x1FDB] = 0x1F77;
		map[0x1FE8] = 0x1FE0;
		map[0x1FE9] = 0x1FE1;
		map[0x1FEA] = 0x1F7A;
		map[0x1FEB] = 0x1F7B;
		map[0x1FEC] = 0x1FE5;
		map[0x1FF8] = 0x1F78;
		map[0x1FF9] = 0x1F79;
		map[0x1FFA] = 0x1F7C;
		map[0x1FFB] = 0x1F7D;
		map[0x1FFC] = 0x1FF3;
		map[0x2126] = 0x03C9;
		map[0x212A] = 0x006B;
		map[0x212B] = 0x00E5;
		map[0x2132] = 0x214E;
		map[0x2160] = 0x2170;
		map[0x2161] = 0x2171;
		map[0x2162] = 0x2172;
		map[0x2163] = 0x2173;
		map[0x2164] = 0x2174;
		map[0x2165] = 0x2175;
		map[0x2166] = 0x2176;
		map[0x2167] = 0x2177;
		map[0x2168] = 0x2178;
		map[0x2169] = 0x2179;
		map[0x216A] = 0x217A;
		map[0x216B] = 0x217B;
		map[0x216C] = 0x217C;
		map[0x216D] = 0x217D;
		map[0x216E] = 0x217E;
		map[0x216F] = 0x217F;
		map[0x2183] = 0x2184;
		map[0x24B6] = 0x24D0;
		map[0x24B7] = 0x24D1;
		map[0x24B8] = 0x24D2;
		map[0x24B9] = 0x24D3;
		map[0x24BA] = 0x24D4;
		map[0x24BB] = 0x24D5;
		map[0x24BC] = 0x24D6;
		map[0x24BD] = 0x24D7;
		map[0x24BE] = 0x24D8;
		map[0x24BF] = 0x24D9;
		map[0x24C0] = 0x24DA;
		map[0x24C1] = 0x24DB;
		map[0x24C2] = 0x24DC;
		map[0x24C3] = 0x24DD;
		map[0x24C4] = 0x24DE;
		map[0x24C5] = 0x24DF;
		map[0x24C6] = 0x24E0;
		map[0x24C7] = 0x24E1;
		map[0x24C8] = 0x24E2;
		map[0x24C9] = 0x24E3;
		map[0x24CA] = 0x24E4;
		map[0x24CB] = 0x24E5;
		map[0x24CC] = 0x24E6;
		map[0x24CD] = 0x24E7;
		map[0x24CE] = 0x24E8;
		map[0x24CF] = 0x24E9;
		map[0x2C00] = 0x2C30;
		map[0x2C01] = 0x2C31;
		map[0x2C02] = 0x2C32;
		map[0x2C03] = 0x2C33;
		map[0x2C04] = 0x2C34;
		map[0x2C05] = 0x2C35;
		map[0x2C06] = 0x2C36;
		map[0x2C07] = 0x2C37;
		map[0x2C08] = 0x2C38;
		map[0x2C09] = 0x2C39;
		map[0x2C0A] = 0x2C3A;
		map[0x2C0B] = 0x2C3B;
		map[0x2C0C] = 0x2C3C;
		map[0x2C0D] = 0x2C3D;
		map[0x2C0E] = 0x2C3E;
		map[0x2C0F] = 0x2C3F;
		map[0x2C10] = 0x2C40;
		map[0x2C11] = 0x2C41;
		map[0x2C12] = 0x2C42;
		map[0x2C13] = 0x2C43;
		map[0x2C14] = 0x2C44;
		map[0x2C15] = 0x2C45;
		map[0x2C16] = 0x2C46;
		map[0x2C17] = 0x2C47;
		map[0x2C18] = 0x2C48;
		map[0x2C19] = 0x2C49;
		map[0x2C1A] = 0x2C4A;
		map[0x2C1B] = 0x2C4B;
		map[0x2C1C] = 0x2C4C;
		map[0x2C1D] = 0x2C4D;
		map[0x2C1E] = 0x2C4E;
		map[0x2C1F] = 0x2C4F;
		map[0x2C20] = 0x2C50;
		map[0x2C21] = 0x2C51;
		map[0x2C22] = 0x2C52;
		map[0x2C23] = 0x2C53;
		map[0x2C24] = 0x2C54;
		map[0x2C25] = 0x2C55;
		map[0x2C26] = 0x2C56;
		map[0x2C27] = 0x2C57;
		map[0x2C28] = 0x2C58;
		map[0x2C29] = 0x2C59;
		map[0x2C2A] = 0x2C5A;
		map[0x2C2B] = 0x2C5B;
		map[0x2C2C] = 0x2C5C;
		map[0x2C2D] = 0x2C5D;
		map[0x2C2E] = 0x2C5E;
		map[0x2C60] = 0x2C61;
		map[0x2C62] = 0x026B;
		map[0x2C63] = 0x1D7D;
		map[0x2C64] = 0x027D;
		map[0x2C67] = 0x2C68;
		map[0x2C69] = 0x2C6A;
		map[0x2C6B] = 0x2C6C;
		map[0x2C6D] = 0x0251;
		map[0x2C6E] = 0x0271;
		map[0x2C6F] = 0x0250;
		map[0x2C70] = 0x0252;
		map[0x2C72] = 0x2C73;
		map[0x2C75] = 0x2C76;
		map[0x2C7E] = 0x023F;
		map[0x2C7F] = 0x0240;
		map[0x2C80] = 0x2C81;
		map[0x2C82] = 0x2C83;
		map[0x2C84] = 0x2C85;
		map[0x2C86] = 0x2C87;
		map[0x2C88] = 0x2C89;
		map[0x2C8A] = 0x2C8B;
		map[0x2C8C] = 0x2C8D;
		map[0x2C8E] = 0x2C8F;
		map[0x2C90] = 0x2C91;
		map[0x2C92] = 0x2C93;
		map[0x2C94] = 0x2C95;
		map[0x2C96] = 0x2C97;
		map[0x2C98] = 0x2C99;
		map[0x2C9A] = 0x2C9B;
		map[0x2C9C] = 0x2C9D;
		map[0x2C9E] = 0x2C9F;
		map[0x2CA0] = 0x2CA1;
		map[0x2CA2] = 0x2CA3;
		map[0x2CA4] = 0x2CA5;
		map[0x2CA6] = 0x2CA7;
		map[0x2CA8] = 0x2CA9;
		map[0x2CAA] = 0x2CAB;
		map[0x2CAC] = 0x2CAD;
		map[0x2CAE] = 0x2CAF;
		map[0x2CB0] = 0x2CB1;
		map[0x2CB2] = 0x2CB3;
		map[0x2CB4] = 0x2CB5;
		map[0x2CB6] = 0x2CB7;
		map[0x2CB8] = 0x2CB9;
		map[0x2CBA] = 0x2CBB;
		map[0x2CBC] = 0x2CBD;
		map[0x2CBE] = 0x2CBF;
		map[0x2CC0] = 0x2CC1;
		map[0x2CC2] = 0x2CC3;
		map[0x2CC4] = 0x2CC5;
		map[0x2CC6] = 0x2CC7;
		map[0x2CC8] = 0x2CC9;
		map[0x2CCA] = 0x2CCB;
		map[0x2CCC] = 0x2CCD;
		map[0x2CCE] = 0x2CCF;
		map[0x2CD0] = 0x2CD1;
		map[0x2CD2] = 0x2CD3;
		map[0x2CD4] = 0x2CD5;
		map[0x2CD6] = 0x2CD7;
		map[0x2CD8] = 0x2CD9;
		map[0x2CDA] = 0x2CDB;
		map[0x2CDC] = 0x2CDD;
		map[0x2CDE] = 0x2CDF;
		map[0x2CE0] = 0x2CE1;
		map[0x2CE2] = 0x2CE3;
		map[0x2CEB] = 0x2CEC;
		map[0x2CED] = 0x2CEE;
		map[0x2CF2] = 0x2CF3;
		map[0xA640] = 0xA641;
		map[0xA642] = 0xA643;
		map[0xA644] = 0xA645;
		map[0xA646] = 0xA647;
		map[0xA648] = 0xA649;
		map[0xA64A] = 0xA64B;
		map[0xA64C] = 0xA64D;
		map[0xA64E] = 0xA64F;
		map[0xA650] = 0xA651;
		map[0xA652] = 0xA653;
		map[0xA654] = 0xA655;
		map[0xA656] = 0xA657;
		map[0xA658] = 0xA659;
		map[0xA65A] = 0xA65B;
		map[0xA65C] = 0xA65D;
		map[0xA65E] = 0xA65F;
		map[0xA660] = 0xA661;
		map[0xA662] = 0xA663;
		map[0xA664] = 0xA665;
		map[0xA666] = 0xA667;
		map[0xA668] = 0xA669;
		map[0xA66A] = 0xA66B;
		map[0xA66C] = 0xA66D;
		map[0xA680] = 0xA681;
		map[0xA682] = 0xA683;
		map[0xA684] = 0xA685;
		map[0xA686] = 0xA687;
		map[0xA688] = 0xA689;
		map[0xA68A] = 0xA68B;
		map[0xA68C] = 0xA68D;
		map[0xA68E] = 0xA68F;
		map[0xA690] = 0xA691;
		map[0xA692] = 0xA693;
		map[0xA694] = 0xA695;
		map[0xA696] = 0xA697;
		map[0xA722] = 0xA723;
		map[0xA724] = 0xA725;
		map[0xA726] = 0xA727;
		map[0xA728] = 0xA729;
		map[0xA72A] = 0xA72B;
		map[0xA72C] = 0xA72D;
		map[0xA72E] = 0xA72F;
		map[0xA732] = 0xA733;
		map[0xA734] = 0xA735;
		map[0xA736] = 0xA737;
		map[0xA738] = 0xA739;
		map[0xA73A] = 0xA73B;
		map[0xA73C] = 0xA73D;
		map[0xA73E] = 0xA73F;
		map[0xA740] = 0xA741;
		map[0xA742] = 0xA743;
		map[0xA744] = 0xA745;
		map[0xA746] = 0xA747;
		map[0xA748] = 0xA749;
		map[0xA74A] = 0xA74B;
		map[0xA74C] = 0xA74D;
		map[0xA74E] = 0xA74F;
		map[0xA750] = 0xA751;
		map[0xA752] = 0xA753;
		map[0xA754] = 0xA755;
		map[0xA756] = 0xA757;
		map[0xA758] = 0xA759;
		map[0xA75A] = 0xA75B;
		map[0xA75C] = 0xA75D;
		map[0xA75E] = 0xA75F;
		map[0xA760] = 0xA761;
		map[0xA762] = 0xA763;
		map[0xA764] = 0xA765;
		map[0xA766] = 0xA767;
		map[0xA768] = 0xA769;
		map[0xA76A] = 0xA76B;
		map[0xA76C] = 0xA76D;
		map[0xA76E] = 0xA76F;
		map[0xA779] = 0xA77A;
		map[0xA77B] = 0xA77C;
		map[0xA77D] = 0x1D79;
		map[0xA77E] = 0xA77F;
		map[0xA780] = 0xA781;
		map[0xA782] = 0xA783;
		map[0xA784] = 0xA785;
		map[0xA786] = 0xA787;
		map[0xA78B] = 0xA78C;
		map[0xA78D] = 0x0265;
		map[0xA790] = 0xA791;
		map[0xA792] = 0xA793;
		map[0xA7A0] = 0xA7A1;
		map[0xA7A2] = 0xA7A3;
		map[0xA7A4] = 0xA7A5;
		map[0xA7A6] = 0xA7A7;
		map[0xA7A8] = 0xA7A9;
		map[0xA7AA] = 0x0266;
		map[0xFF21] = 0xFF41;
		map[0xFF22] = 0xFF42;
		map[0xFF23] = 0xFF43;
		map[0xFF24] = 0xFF44;
		map[0xFF25] = 0xFF45;
		map[0xFF26] = 0xFF46;
		map[0xFF27] = 0xFF47;
		map[0xFF28] = 0xFF48;
		map[0xFF29] = 0xFF49;
		map[0xFF2A] = 0xFF4A;
		map[0xFF2B] = 0xFF4B;
		map[0xFF2C] = 0xFF4C;
		map[0xFF2D] = 0xFF4D;
		map[0xFF2E] = 0xFF4E;
		map[0xFF2F] = 0xFF4F;
		map[0xFF30] = 0xFF50;
		map[0xFF31] = 0xFF51;
		map[0xFF32] = 0xFF52;
		map[0xFF33] = 0xFF53;
		map[0xFF34] = 0xFF54;
		map[0xFF35] = 0xFF55;
		map[0xFF36] = 0xFF56;
		map[0xFF37] = 0xFF57;
		map[0xFF38] = 0xFF58;
		map[0xFF39] = 0xFF59;
		map[0xFF3A] = 0xFF5A;
		map[0x10400] = 0x10428;
		map[0x10401] = 0x10429;
		map[0x10402] = 0x1042A;
		map[0x10403] = 0x1042B;
		map[0x10404] = 0x1042C;
		map[0x10405] = 0x1042D;
		map[0x10406] = 0x1042E;
		map[0x10407] = 0x1042F;
		map[0x10408] = 0x10430;
		map[0x10409] = 0x10431;
		map[0x1040A] = 0x10432;
		map[0x1040B] = 0x10433;
		map[0x1040C] = 0x10434;
		map[0x1040D] = 0x10435;
		map[0x1040E] = 0x10436;
		map[0x1040F] = 0x10437;
		map[0x10410] = 0x10438;
		map[0x10411] = 0x10439;
		map[0x10412] = 0x1043A;
		map[0x10413] = 0x1043B;
		map[0x10414] = 0x1043C;
		map[0x10415] = 0x1043D;
		map[0x10416] = 0x1043E;
		map[0x10417] = 0x1043F;
		map[0x10418] = 0x10440;
		map[0x10419] = 0x10441;
		map[0x1041A] = 0x10442;
		map[0x1041B] = 0x10443;
		map[0x1041C] = 0x10444;
		map[0x1041D] = 0x10445;
		map[0x1041E] = 0x10446;
		map[0x1041F] = 0x10447;
		map[0x10420] = 0x10448;
		map[0x10421] = 0x10449;
		map[0x10422] = 0x1044A;
		map[0x10423] = 0x1044B;
		map[0x10424] = 0x1044C;
		map[0x10425] = 0x1044D;
		map[0x10426] = 0x1044E;
		map[0x10427] = 0x1044F;
	}
}
