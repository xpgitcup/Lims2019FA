/*
 Navicat Premium Data Transfer

 Source Server         : 10.1.16.50
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : 10.1.16.50:3306
 Source Schema         : lims2019db

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 19/05/2019 18:10:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for project_plan_progress
-- ----------------------------
DROP TABLE IF EXISTS `project_plan_progress`;
CREATE TABLE `project_plan_progress`  (
  `project_plan_progresses_id` bigint(20) NOT NULL,
  `progress_id` bigint(20) NULL DEFAULT NULL,
  INDEX `FK2dl0vqwriw4qodso33aajn5pv`(`progress_id`) USING BTREE,
  INDEX `FK3aybdeo9o3nbh6eptc9wbmt29`(`project_plan_progresses_id`) USING BTREE,
  CONSTRAINT `FK2dl0vqwriw4qodso33aajn5pv` FOREIGN KEY (`progress_id`) REFERENCES `progress` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK3aybdeo9o3nbh6eptc9wbmt29` FOREIGN KEY (`project_plan_progresses_id`) REFERENCES `project_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_plan_progress
-- ----------------------------
INSERT INTO `project_plan_progress` VALUES (172, 148);
INSERT INTO `project_plan_progress` VALUES (172, 150);
INSERT INTO `project_plan_progress` VALUES (172, 151);
INSERT INTO `project_plan_progress` VALUES (172, 158);
INSERT INTO `project_plan_progress` VALUES (172, 172);
INSERT INTO `project_plan_progress` VALUES (172, 176);
INSERT INTO `project_plan_progress` VALUES (172, 177);
INSERT INTO `project_plan_progress` VALUES (172, 178);
INSERT INTO `project_plan_progress` VALUES (172, 179);
INSERT INTO `project_plan_progress` VALUES (172, 180);
INSERT INTO `project_plan_progress` VALUES (172, 181);
INSERT INTO `project_plan_progress` VALUES (172, 187);
INSERT INTO `project_plan_progress` VALUES (172, 192);
INSERT INTO `project_plan_progress` VALUES (167, 153);
INSERT INTO `project_plan_progress` VALUES (167, 154);
INSERT INTO `project_plan_progress` VALUES (167, 185);
INSERT INTO `project_plan_progress` VALUES (168, 186);
INSERT INTO `project_plan_progress` VALUES (182, 160);
INSERT INTO `project_plan_progress` VALUES (182, 161);
INSERT INTO `project_plan_progress` VALUES (182, 162);
INSERT INTO `project_plan_progress` VALUES (182, 163);
INSERT INTO `project_plan_progress` VALUES (182, 164);
INSERT INTO `project_plan_progress` VALUES (182, 165);
INSERT INTO `project_plan_progress` VALUES (182, 166);
INSERT INTO `project_plan_progress` VALUES (184, 183);
INSERT INTO `project_plan_progress` VALUES (184, 184);
INSERT INTO `project_plan_progress` VALUES (36, 27);
INSERT INTO `project_plan_progress` VALUES (46, 45);
INSERT INTO `project_plan_progress` VALUES (46, 47);
INSERT INTO `project_plan_progress` VALUES (46, 48);
INSERT INTO `project_plan_progress` VALUES (46, 31);
INSERT INTO `project_plan_progress` VALUES (46, 32);
INSERT INTO `project_plan_progress` VALUES (46, 33);
INSERT INTO `project_plan_progress` VALUES (46, 34);
INSERT INTO `project_plan_progress` VALUES (46, 35);
INSERT INTO `project_plan_progress` VALUES (46, 36);
INSERT INTO `project_plan_progress` VALUES (46, 37);
INSERT INTO `project_plan_progress` VALUES (46, 38);
INSERT INTO `project_plan_progress` VALUES (46, 39);
INSERT INTO `project_plan_progress` VALUES (46, 40);
INSERT INTO `project_plan_progress` VALUES (46, 41);
INSERT INTO `project_plan_progress` VALUES (46, 42);
INSERT INTO `project_plan_progress` VALUES (46, 43);
INSERT INTO `project_plan_progress` VALUES (46, 44);
INSERT INTO `project_plan_progress` VALUES (46, 29);
INSERT INTO `project_plan_progress` VALUES (162, 159);
INSERT INTO `project_plan_progress` VALUES (162, 193);
INSERT INTO `project_plan_progress` VALUES (162, 194);
INSERT INTO `project_plan_progress` VALUES (162, 195);
INSERT INTO `project_plan_progress` VALUES (162, 196);
INSERT INTO `project_plan_progress` VALUES (162, 197);
INSERT INTO `project_plan_progress` VALUES (162, 198);
INSERT INTO `project_plan_progress` VALUES (162, 199);
INSERT INTO `project_plan_progress` VALUES (169, 200);
INSERT INTO `project_plan_progress` VALUES (120, 46);
INSERT INTO `project_plan_progress` VALUES (120, 104);
INSERT INTO `project_plan_progress` VALUES (120, 105);
INSERT INTO `project_plan_progress` VALUES (120, 109);
INSERT INTO `project_plan_progress` VALUES (120, 115);
INSERT INTO `project_plan_progress` VALUES (120, 170);
INSERT INTO `project_plan_progress` VALUES (19, 49);
INSERT INTO `project_plan_progress` VALUES (19, 51);
INSERT INTO `project_plan_progress` VALUES (19, 50);
INSERT INTO `project_plan_progress` VALUES (16, 17);
INSERT INTO `project_plan_progress` VALUES (16, 200);
INSERT INTO `project_plan_progress` VALUES (12, 201);
INSERT INTO `project_plan_progress` VALUES (13, 202);
INSERT INTO `project_plan_progress` VALUES (12, 203);
INSERT INTO `project_plan_progress` VALUES (16, 204);
INSERT INTO `project_plan_progress` VALUES (22, 205);
INSERT INTO `project_plan_progress` VALUES (26, 206);
INSERT INTO `project_plan_progress` VALUES (24, 207);
INSERT INTO `project_plan_progress` VALUES (12, 208);
INSERT INTO `project_plan_progress` VALUES (6, 110);
INSERT INTO `project_plan_progress` VALUES (6, 111);
INSERT INTO `project_plan_progress` VALUES (6, 140);
INSERT INTO `project_plan_progress` VALUES (6, 141);
INSERT INTO `project_plan_progress` VALUES (6, 142);
INSERT INTO `project_plan_progress` VALUES (6, 143);
INSERT INTO `project_plan_progress` VALUES (6, 144);
INSERT INTO `project_plan_progress` VALUES (6, 145);
INSERT INTO `project_plan_progress` VALUES (6, 146);
INSERT INTO `project_plan_progress` VALUES (6, 147);
INSERT INTO `project_plan_progress` VALUES (162, 209);
INSERT INTO `project_plan_progress` VALUES (181, 210);
INSERT INTO `project_plan_progress` VALUES (181, 211);
INSERT INTO `project_plan_progress` VALUES (184, 210);
INSERT INTO `project_plan_progress` VALUES (184, 211);
INSERT INTO `project_plan_progress` VALUES (177, 212);
INSERT INTO `project_plan_progress` VALUES (177, 217);
INSERT INTO `project_plan_progress` VALUES (177, 218);
INSERT INTO `project_plan_progress` VALUES (173, 219);
INSERT INTO `project_plan_progress` VALUES (177, 220);
INSERT INTO `project_plan_progress` VALUES (166, 221);
INSERT INTO `project_plan_progress` VALUES (167, 221);
INSERT INTO `project_plan_progress` VALUES (166, 222);
INSERT INTO `project_plan_progress` VALUES (167, 222);
INSERT INTO `project_plan_progress` VALUES (169, 223);
INSERT INTO `project_plan_progress` VALUES (181, 224);
INSERT INTO `project_plan_progress` VALUES (227, 11);
INSERT INTO `project_plan_progress` VALUES (227, 137);
INSERT INTO `project_plan_progress` VALUES (227, 152);
INSERT INTO `project_plan_progress` VALUES (227, 167);
INSERT INTO `project_plan_progress` VALUES (227, 168);
INSERT INTO `project_plan_progress` VALUES (162, 226);
INSERT INTO `project_plan_progress` VALUES (220, 227);
INSERT INTO `project_plan_progress` VALUES (217, 228);
INSERT INTO `project_plan_progress` VALUES (217, 116);
INSERT INTO `project_plan_progress` VALUES (217, 117);
INSERT INTO `project_plan_progress` VALUES (217, 119);
INSERT INTO `project_plan_progress` VALUES (217, 120);
INSERT INTO `project_plan_progress` VALUES (217, 171);
INSERT INTO `project_plan_progress` VALUES (217, 229);
INSERT INTO `project_plan_progress` VALUES (220, 7);
INSERT INTO `project_plan_progress` VALUES (220, 62);
INSERT INTO `project_plan_progress` VALUES (107, 230);
INSERT INTO `project_plan_progress` VALUES (107, 231);
INSERT INTO `project_plan_progress` VALUES (107, 232);
INSERT INTO `project_plan_progress` VALUES (110, 233);
INSERT INTO `project_plan_progress` VALUES (214, 235);
INSERT INTO `project_plan_progress` VALUES (163, 225);
INSERT INTO `project_plan_progress` VALUES (182, 224);
INSERT INTO `project_plan_progress` VALUES (6, 236);
INSERT INTO `project_plan_progress` VALUES (6, 237);
INSERT INTO `project_plan_progress` VALUES (6, 238);
INSERT INTO `project_plan_progress` VALUES (6, 239);
INSERT INTO `project_plan_progress` VALUES (6, 240);
INSERT INTO `project_plan_progress` VALUES (6, 241);
INSERT INTO `project_plan_progress` VALUES (168, 242);
INSERT INTO `project_plan_progress` VALUES (169, 243);
INSERT INTO `project_plan_progress` VALUES (167, 244);
INSERT INTO `project_plan_progress` VALUES (181, 246);
INSERT INTO `project_plan_progress` VALUES (182, 246);
INSERT INTO `project_plan_progress` VALUES (168, 247);
INSERT INTO `project_plan_progress` VALUES (85, 248);
INSERT INTO `project_plan_progress` VALUES (96, 249);
INSERT INTO `project_plan_progress` VALUES (86, 250);
INSERT INTO `project_plan_progress` VALUES (89, 251);
INSERT INTO `project_plan_progress` VALUES (86, 252);
INSERT INTO `project_plan_progress` VALUES (220, 253);
INSERT INTO `project_plan_progress` VALUES (220, 254);
INSERT INTO `project_plan_progress` VALUES (211, 256);
INSERT INTO `project_plan_progress` VALUES (211, 257);
INSERT INTO `project_plan_progress` VALUES (213, 26);
INSERT INTO `project_plan_progress` VALUES (213, 57);
INSERT INTO `project_plan_progress` VALUES (213, 59);
INSERT INTO `project_plan_progress` VALUES (213, 122);
INSERT INTO `project_plan_progress` VALUES (213, 123);
INSERT INTO `project_plan_progress` VALUES (213, 124);
INSERT INTO `project_plan_progress` VALUES (213, 257);
INSERT INTO `project_plan_progress` VALUES (213, 255);
INSERT INTO `project_plan_progress` VALUES (213, 260);
INSERT INTO `project_plan_progress` VALUES (213, 259);
INSERT INTO `project_plan_progress` VALUES (219, 52);
INSERT INTO `project_plan_progress` VALUES (218, 116);
INSERT INTO `project_plan_progress` VALUES (218, 117);
INSERT INTO `project_plan_progress` VALUES (218, 118);
INSERT INTO `project_plan_progress` VALUES (218, 119);
INSERT INTO `project_plan_progress` VALUES (218, 120);
INSERT INTO `project_plan_progress` VALUES (218, 171);
INSERT INTO `project_plan_progress` VALUES (218, 229);
INSERT INTO `project_plan_progress` VALUES (219, 228);
INSERT INTO `project_plan_progress` VALUES (118, 55);
INSERT INTO `project_plan_progress` VALUES (117, 99);
INSERT INTO `project_plan_progress` VALUES (117, 100);
INSERT INTO `project_plan_progress` VALUES (117, 127);
INSERT INTO `project_plan_progress` VALUES (117, 128);
INSERT INTO `project_plan_progress` VALUES (105, 54);
INSERT INTO `project_plan_progress` VALUES (105, 98);
INSERT INTO `project_plan_progress` VALUES (105, 107);
INSERT INTO `project_plan_progress` VALUES (105, 113);
INSERT INTO `project_plan_progress` VALUES (105, 169);
INSERT INTO `project_plan_progress` VALUES (105, 191);
INSERT INTO `project_plan_progress` VALUES (108, 30);
INSERT INTO `project_plan_progress` VALUES (108, 102);
INSERT INTO `project_plan_progress` VALUES (108, 103);
INSERT INTO `project_plan_progress` VALUES (108, 112);
INSERT INTO `project_plan_progress` VALUES (108, 173);
INSERT INTO `project_plan_progress` VALUES (108, 174);
INSERT INTO `project_plan_progress` VALUES (108, 230);
INSERT INTO `project_plan_progress` VALUES (109, 231);
INSERT INTO `project_plan_progress` VALUES (109, 232);
INSERT INTO `project_plan_progress` VALUES (225, 53);
INSERT INTO `project_plan_progress` VALUES (225, 121);
INSERT INTO `project_plan_progress` VALUES (224, 97);
INSERT INTO `project_plan_progress` VALUES (224, 108);
INSERT INTO `project_plan_progress` VALUES (111, 19);
INSERT INTO `project_plan_progress` VALUES (111, 63);
INSERT INTO `project_plan_progress` VALUES (111, 130);
INSERT INTO `project_plan_progress` VALUES (111, 233);
INSERT INTO `project_plan_progress` VALUES (196, 4);
INSERT INTO `project_plan_progress` VALUES (196, 56);
INSERT INTO `project_plan_progress` VALUES (196, 134);
INSERT INTO `project_plan_progress` VALUES (196, 135);
INSERT INTO `project_plan_progress` VALUES (187, 21);
INSERT INTO `project_plan_progress` VALUES (187, 64);
INSERT INTO `project_plan_progress` VALUES (187, 101);
INSERT INTO `project_plan_progress` VALUES (187, 106);
INSERT INTO `project_plan_progress` VALUES (188, 138);
INSERT INTO `project_plan_progress` VALUES (188, 139);
INSERT INTO `project_plan_progress` VALUES (188, 149);
INSERT INTO `project_plan_progress` VALUES (213, 258);
INSERT INTO `project_plan_progress` VALUES (215, 12);
INSERT INTO `project_plan_progress` VALUES (215, 58);
INSERT INTO `project_plan_progress` VALUES (215, 131);
INSERT INTO `project_plan_progress` VALUES (216, 234);
INSERT INTO `project_plan_progress` VALUES (216, 235);
INSERT INTO `project_plan_progress` VALUES (193, 22);
INSERT INTO `project_plan_progress` VALUES (193, 60);
INSERT INTO `project_plan_progress` VALUES (193, 65);
INSERT INTO `project_plan_progress` VALUES (194, 136);
INSERT INTO `project_plan_progress` VALUES (221, 7);
INSERT INTO `project_plan_progress` VALUES (221, 62);
INSERT INTO `project_plan_progress` VALUES (221, 114);
INSERT INTO `project_plan_progress` VALUES (221, 227);
INSERT INTO `project_plan_progress` VALUES (221, 253);
INSERT INTO `project_plan_progress` VALUES (221, 254);
INSERT INTO `project_plan_progress` VALUES (114, 14);
INSERT INTO `project_plan_progress` VALUES (114, 61);
INSERT INTO `project_plan_progress` VALUES (114, 126);
INSERT INTO `project_plan_progress` VALUES (114, 132);
INSERT INTO `project_plan_progress` VALUES (114, 133);
INSERT INTO `project_plan_progress` VALUES (115, 188);
INSERT INTO `project_plan_progress` VALUES (115, 189);
INSERT INTO `project_plan_progress` VALUES (115, 190);
INSERT INTO `project_plan_progress` VALUES (188, 263);
INSERT INTO `project_plan_progress` VALUES (228, 264);
INSERT INTO `project_plan_progress` VALUES (104, 265);
INSERT INTO `project_plan_progress` VALUES (228, 268);
INSERT INTO `project_plan_progress` VALUES (228, 269);
INSERT INTO `project_plan_progress` VALUES (119, 270);
INSERT INTO `project_plan_progress` VALUES (119, 271);
INSERT INTO `project_plan_progress` VALUES (119, 272);
INSERT INTO `project_plan_progress` VALUES (119, 273);
INSERT INTO `project_plan_progress` VALUES (119, 274);
INSERT INTO `project_plan_progress` VALUES (119, 275);
INSERT INTO `project_plan_progress` VALUES (119, 276);
INSERT INTO `project_plan_progress` VALUES (119, 277);
INSERT INTO `project_plan_progress` VALUES (119, 278);
INSERT INTO `project_plan_progress` VALUES (228, 279);
INSERT INTO `project_plan_progress` VALUES (293, 280);
INSERT INTO `project_plan_progress` VALUES (307, 282);
INSERT INTO `project_plan_progress` VALUES (307, 281);
INSERT INTO `project_plan_progress` VALUES (7, 283);
INSERT INTO `project_plan_progress` VALUES (7, 284);
INSERT INTO `project_plan_progress` VALUES (300, 285);
INSERT INTO `project_plan_progress` VALUES (177, 286);
INSERT INTO `project_plan_progress` VALUES (177, 287);
INSERT INTO `project_plan_progress` VALUES (178, 288);
INSERT INTO `project_plan_progress` VALUES (177, 289);
INSERT INTO `project_plan_progress` VALUES (181, 290);
INSERT INTO `project_plan_progress` VALUES (179, 291);
INSERT INTO `project_plan_progress` VALUES (171, 293);
INSERT INTO `project_plan_progress` VALUES (228, 294);
INSERT INTO `project_plan_progress` VALUES (228, 295);
INSERT INTO `project_plan_progress` VALUES (228, 296);
INSERT INTO `project_plan_progress` VALUES (135, 1);
INSERT INTO `project_plan_progress` VALUES (135, 3);
INSERT INTO `project_plan_progress` VALUES (136, 69);
INSERT INTO `project_plan_progress` VALUES (136, 70);
INSERT INTO `project_plan_progress` VALUES (121, 266);
INSERT INTO `project_plan_progress` VALUES (120, 267);
INSERT INTO `project_plan_progress` VALUES (120, 270);
INSERT INTO `project_plan_progress` VALUES (120, 271);
INSERT INTO `project_plan_progress` VALUES (120, 272);
INSERT INTO `project_plan_progress` VALUES (120, 273);
INSERT INTO `project_plan_progress` VALUES (120, 274);
INSERT INTO `project_plan_progress` VALUES (120, 275);
INSERT INTO `project_plan_progress` VALUES (120, 276);
INSERT INTO `project_plan_progress` VALUES (121, 277);
INSERT INTO `project_plan_progress` VALUES (121, 278);
INSERT INTO `project_plan_progress` VALUES (106, 265);
INSERT INTO `project_plan_progress` VALUES (117, 297);
INSERT INTO `project_plan_progress` VALUES (117, 299);
INSERT INTO `project_plan_progress` VALUES (117, 300);
INSERT INTO `project_plan_progress` VALUES (48, 301);
INSERT INTO `project_plan_progress` VALUES (47, 302);
INSERT INTO `project_plan_progress` VALUES (45, 303);
INSERT INTO `project_plan_progress` VALUES (173, 304);
INSERT INTO `project_plan_progress` VALUES (172, 305);
INSERT INTO `project_plan_progress` VALUES (116, 298);
INSERT INTO `project_plan_progress` VALUES (186, 308);
INSERT INTO `project_plan_progress` VALUES (186, 309);
INSERT INTO `project_plan_progress` VALUES (197, 310);
INSERT INTO `project_plan_progress` VALUES (181, 311);
INSERT INTO `project_plan_progress` VALUES (213, 312);
INSERT INTO `project_plan_progress` VALUES (213, 313);
INSERT INTO `project_plan_progress` VALUES (188, 308);
INSERT INTO `project_plan_progress` VALUES (188, 309);
INSERT INTO `project_plan_progress` VALUES (188, 314);
INSERT INTO `project_plan_progress` VALUES (188, 315);
INSERT INTO `project_plan_progress` VALUES (106, 316);
INSERT INTO `project_plan_progress` VALUES (163, 317);
INSERT INTO `project_plan_progress` VALUES (162, 318);
INSERT INTO `project_plan_progress` VALUES (254, 320);
INSERT INTO `project_plan_progress` VALUES (223, 321);
INSERT INTO `project_plan_progress` VALUES (224, 321);
INSERT INTO `project_plan_progress` VALUES (224, 322);
INSERT INTO `project_plan_progress` VALUES (224, 323);
INSERT INTO `project_plan_progress` VALUES (224, 324);
INSERT INTO `project_plan_progress` VALUES (224, 325);
INSERT INTO `project_plan_progress` VALUES (342, 326);
INSERT INTO `project_plan_progress` VALUES (344, 327);
INSERT INTO `project_plan_progress` VALUES (188, 328);
INSERT INTO `project_plan_progress` VALUES (188, 329);
INSERT INTO `project_plan_progress` VALUES (113, 330);
INSERT INTO `project_plan_progress` VALUES (113, 331);
INSERT INTO `project_plan_progress` VALUES (113, 332);
INSERT INTO `project_plan_progress` VALUES (116, 333);
INSERT INTO `project_plan_progress` VALUES (116, 334);
INSERT INTO `project_plan_progress` VALUES (169, 335);
INSERT INTO `project_plan_progress` VALUES (169, 336);
INSERT INTO `project_plan_progress` VALUES (169, 337);
INSERT INTO `project_plan_progress` VALUES (169, 338);
INSERT INTO `project_plan_progress` VALUES (168, 339);
INSERT INTO `project_plan_progress` VALUES (163, 340);
INSERT INTO `project_plan_progress` VALUES (163, 341);
INSERT INTO `project_plan_progress` VALUES (163, 342);
INSERT INTO `project_plan_progress` VALUES (168, 343);
INSERT INTO `project_plan_progress` VALUES (168, 344);
INSERT INTO `project_plan_progress` VALUES (183, 290);
INSERT INTO `project_plan_progress` VALUES (183, 311);
INSERT INTO `project_plan_progress` VALUES (183, 345);
INSERT INTO `project_plan_progress` VALUES (183, 346);
INSERT INTO `project_plan_progress` VALUES (183, 347);
INSERT INTO `project_plan_progress` VALUES (183, 348);
INSERT INTO `project_plan_progress` VALUES (173, 245);
INSERT INTO `project_plan_progress` VALUES (173, 292);
INSERT INTO `project_plan_progress` VALUES (173, 293);
INSERT INTO `project_plan_progress` VALUES (173, 349);
INSERT INTO `project_plan_progress` VALUES (173, 350);
INSERT INTO `project_plan_progress` VALUES (178, 157);
INSERT INTO `project_plan_progress` VALUES (178, 213);
INSERT INTO `project_plan_progress` VALUES (179, 351);
INSERT INTO `project_plan_progress` VALUES (179, 352);
INSERT INTO `project_plan_progress` VALUES (179, 353);
INSERT INTO `project_plan_progress` VALUES (179, 354);
INSERT INTO `project_plan_progress` VALUES (177, 355);
INSERT INTO `project_plan_progress` VALUES (177, 356);
INSERT INTO `project_plan_progress` VALUES (163, 357);
INSERT INTO `project_plan_progress` VALUES (119, 358);
INSERT INTO `project_plan_progress` VALUES (192, 359);
INSERT INTO `project_plan_progress` VALUES (192, 360);
INSERT INTO `project_plan_progress` VALUES (192, 361);
INSERT INTO `project_plan_progress` VALUES (299, 362);
INSERT INTO `project_plan_progress` VALUES (63, 363);
INSERT INTO `project_plan_progress` VALUES (63, 364);
INSERT INTO `project_plan_progress` VALUES (63, 365);
INSERT INTO `project_plan_progress` VALUES (63, 366);
INSERT INTO `project_plan_progress` VALUES (63, 367);
INSERT INTO `project_plan_progress` VALUES (63, 368);
INSERT INTO `project_plan_progress` VALUES (63, 369);
INSERT INTO `project_plan_progress` VALUES (63, 370);
INSERT INTO `project_plan_progress` VALUES (63, 371);
INSERT INTO `project_plan_progress` VALUES (63, 372);
INSERT INTO `project_plan_progress` VALUES (63, 373);
INSERT INTO `project_plan_progress` VALUES (63, 374);
INSERT INTO `project_plan_progress` VALUES (63, 375);
INSERT INTO `project_plan_progress` VALUES (63, 377);
INSERT INTO `project_plan_progress` VALUES (63, 378);
INSERT INTO `project_plan_progress` VALUES (63, 380);
INSERT INTO `project_plan_progress` VALUES (63, 381);
INSERT INTO `project_plan_progress` VALUES (63, 382);
INSERT INTO `project_plan_progress` VALUES (63, 383);
INSERT INTO `project_plan_progress` VALUES (63, 384);
INSERT INTO `project_plan_progress` VALUES (63, 385);
INSERT INTO `project_plan_progress` VALUES (63, 386);
INSERT INTO `project_plan_progress` VALUES (63, 387);
INSERT INTO `project_plan_progress` VALUES (63, 388);
INSERT INTO `project_plan_progress` VALUES (63, 389);
INSERT INTO `project_plan_progress` VALUES (63, 390);
INSERT INTO `project_plan_progress` VALUES (64, 391);
INSERT INTO `project_plan_progress` VALUES (269, 392);
INSERT INTO `project_plan_progress` VALUES (270, 393);
INSERT INTO `project_plan_progress` VALUES (321, 394);
INSERT INTO `project_plan_progress` VALUES (296, 395);
INSERT INTO `project_plan_progress` VALUES (292, 396);
INSERT INTO `project_plan_progress` VALUES (292, 397);
INSERT INTO `project_plan_progress` VALUES (292, 398);
INSERT INTO `project_plan_progress` VALUES (292, 399);
INSERT INTO `project_plan_progress` VALUES (292, 400);
INSERT INTO `project_plan_progress` VALUES (292, 401);
INSERT INTO `project_plan_progress` VALUES (179, 402);
INSERT INTO `project_plan_progress` VALUES (292, 404);
INSERT INTO `project_plan_progress` VALUES (292, 405);
INSERT INTO `project_plan_progress` VALUES (292, 406);
INSERT INTO `project_plan_progress` VALUES (292, 407);
INSERT INTO `project_plan_progress` VALUES (292, 408);
INSERT INTO `project_plan_progress` VALUES (292, 409);
INSERT INTO `project_plan_progress` VALUES (292, 410);
INSERT INTO `project_plan_progress` VALUES (292, 411);
INSERT INTO `project_plan_progress` VALUES (292, 412);
INSERT INTO `project_plan_progress` VALUES (292, 413);
INSERT INTO `project_plan_progress` VALUES (292, 414);
INSERT INTO `project_plan_progress` VALUES (292, 415);
INSERT INTO `project_plan_progress` VALUES (292, 416);
INSERT INTO `project_plan_progress` VALUES (295, 417);
INSERT INTO `project_plan_progress` VALUES (306, 421);
INSERT INTO `project_plan_progress` VALUES (306, 422);
INSERT INTO `project_plan_progress` VALUES (306, 423);
INSERT INTO `project_plan_progress` VALUES (306, 424);
INSERT INTO `project_plan_progress` VALUES (306, 425);
INSERT INTO `project_plan_progress` VALUES (306, 426);
INSERT INTO `project_plan_progress` VALUES (306, 427);
INSERT INTO `project_plan_progress` VALUES (306, 428);
INSERT INTO `project_plan_progress` VALUES (306, 429);
INSERT INTO `project_plan_progress` VALUES (306, 430);

SET FOREIGN_KEY_CHECKS = 1;
