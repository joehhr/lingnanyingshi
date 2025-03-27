/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306_2
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : lingnanyingshi

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 15/03/2025 15:30:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `isdefault` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否默认地址[是/否]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1741557222418 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '2021-03-15 15:59:12', 1, '宇宙银河系金星1号', '金某', '13823888881', '是');
INSERT INTO `address` VALUES (2, '2021-03-15 15:59:12', 2, '宇宙银河系木星1号', '木某', '13823888882', '是');
INSERT INTO `address` VALUES (3, '2021-03-15 15:59:12', 3, '宇宙银河系水星1号', '水某', '13823888883', '是');
INSERT INTO `address` VALUES (4, '2021-03-15 15:59:12', 4, '宇宙银河系火星1号', '火某', '13823888884', '是');
INSERT INTO `address` VALUES (5, '2021-03-15 15:59:12', 5, '宇宙银河系土星1号', '土某', '13823888885', '是');
INSERT INTO `address` VALUES (6, '2021-03-15 15:59:12', 6, '宇宙银河系月球1号', '月某', '13823888886', '是');
INSERT INTO `address` VALUES (1615000734921, '2021-03-06 11:18:53', 11, '陕西省安康市旬阳市小河镇闫家坪', '联系人1', '12312312312', '是');
INSERT INTO `address` VALUES (1616119255002, '2021-03-19 10:00:54', 1616119159806, '北京市丰台区花乡乡南四环西路辅路北京旧车市场', '小王', '12312312311', '是');
INSERT INTO `address` VALUES (1741557222417, '2025-03-10 05:53:42', 1728757242947, '广东省广州市白云区广州理工学院', '用户1', '18888888888', '是');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'shangpinxinxi' COMMENT '商品表名',
  `userid` bigint NOT NULL COMMENT '用户id',
  `goodid` bigint NOT NULL COMMENT '商品id',
  `goodname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `buynumber` int NOT NULL COMMENT '购买数量',
  `price` float NULL DEFAULT NULL COMMENT '单价',
  `discountprice` float NULL DEFAULT NULL COMMENT '会员价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1741556053637 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1705025242458, '2024-01-12 10:07:22', 'shangpinxinxi', 11, 42, '糯米鸡', 'http://localhost:8080/lingnanyingshiwenhua/upload/nuomiji.webp', 2, 99.9, 0);
INSERT INTO `cart` VALUES (1741556053636, '2025-03-10 05:34:13', 'shangpinxinxi', 1728757242947, 42, '白切鸡', 'http://localhost:8080/lingnanyingshiwenhua/upload/baiqieji.jpg', 1, 99.9, 0);

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `adminid` bigint NULL DEFAULT NULL COMMENT '管理员id',
  `ask` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '提问',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复',
  `isreply` int NULL DEFAULT NULL COMMENT '是否回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1741991562335 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服聊天表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES (61, '2021-03-15 15:59:12', 1, 1, '提问1', '回复1', 0);
INSERT INTO `chat` VALUES (62, '2021-03-15 15:59:12', 2, 2, '提问2', '回复2', 2);
INSERT INTO `chat` VALUES (63, '2021-03-15 15:59:12', 3, 3, '提问3', '回复3', 3);
INSERT INTO `chat` VALUES (64, '2021-03-15 15:59:12', 4, 4, '提问4', '回复4', 4);
INSERT INTO `chat` VALUES (65, '2021-03-15 15:59:12', 5, 5, '提问5', '回复5', 5);
INSERT INTO `chat` VALUES (66, '2021-03-15 15:59:12', 6, 6, '提问6', '回复6', 6);
INSERT INTO `chat` VALUES (1615551500494, '2021-03-12 20:18:20', 11, NULL, '123123', NULL, 0);
INSERT INTO `chat` VALUES (1615551511515, '2021-03-12 20:18:30', 11, NULL, '这里可以和客服进行投书', NULL, 0);
INSERT INTO `chat` VALUES (1615551539376, '2021-03-12 20:18:58', 1, 1, NULL, '213231', NULL);
INSERT INTO `chat` VALUES (1615551539554, '2021-03-12 20:18:58', 1, 1, NULL, '213231', 0);
INSERT INTO `chat` VALUES (1615551545730, '2021-03-12 20:19:05', 11, 1, NULL, '213132132', 0);
INSERT INTO `chat` VALUES (1615551545806, '2021-03-12 20:19:05', 11, 1, NULL, '213132132', 0);
INSERT INTO `chat` VALUES (1615551546125, '2021-03-12 20:19:05', 11, 1, NULL, '213132132', NULL);
INSERT INTO `chat` VALUES (1728757846050, '2024-10-13 02:30:45', 1728757242947, NULL, '123', NULL, 0);
INSERT INTO `chat` VALUES (1741072279338, '2025-03-04 15:11:18', 1728757242947, NULL, '456', NULL, 0);
INSERT INTO `chat` VALUES (1741991562334, '2025-03-15 06:32:41', 1728757242947, NULL, '789', NULL, 1);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'http://localhost:8080/lingnanyingshiwenhua/upload/carousel6.jpg');
INSERT INTO `config` VALUES (2, 'picture2', 'http://localhost:8080/lingnanyingshiwenhua/upload/carousel1.jpg');
INSERT INTO `config` VALUES (3, 'picture3', 'http://localhost:8080/lingnanyingshiwenhua/upload/carousel7.jpg');
INSERT INTO `config` VALUES (6, 'homepage', 'http://localhost:8080/lingnanyingshiwenhua/upload/carousel5.jpg');

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint NULL DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码名字',
  `super_id` int NULL DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES (1, 'sf_types', '是否同意', 2, '是', NULL, '2021-02-25 11:41:54');
INSERT INTO `dictionary` VALUES (2, 'sf_types', '是否同意', 1, '否', NULL, '2021-02-25 11:41:54');

-- ----------------------------
-- Table structure for discussshangpinxinxi
-- ----------------------------
DROP TABLE IF EXISTS `discussshangpinxinxi`;
CREATE TABLE `discussshangpinxinxi`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint NOT NULL COMMENT '关联表id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1741558557316 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of discussshangpinxinxi
-- ----------------------------
INSERT INTO `discussshangpinxinxi` VALUES (121, '2021-03-15 15:59:12', 1, 1, '评论内容1', '回复内容1');
INSERT INTO `discussshangpinxinxi` VALUES (122, '2021-03-15 15:59:12', 2, 2, '评论内容2', '回复内容2');
INSERT INTO `discussshangpinxinxi` VALUES (123, '2021-03-15 15:59:12', 3, 3, '评论内容3', '回复内容3');
INSERT INTO `discussshangpinxinxi` VALUES (124, '2021-03-15 15:59:12', 4, 4, '评论内容4', '回复内容4');
INSERT INTO `discussshangpinxinxi` VALUES (125, '2021-03-15 15:59:12', 5, 5, '评论内容5', '回复内容5');
INSERT INTO `discussshangpinxinxi` VALUES (126, '2021-03-15 15:59:12', 6, 6, '评论内容6', '回复内容6');
INSERT INTO `discussshangpinxinxi` VALUES (1615551314339, '2021-03-12 20:15:13', 1615551151507, 11, '买了几次挺不错的', NULL);
INSERT INTO `discussshangpinxinxi` VALUES (1741558557315, '2025-03-10 06:15:56', 42, 1728757242947, '好吃！！！', NULL);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品资讯' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (111, '2021-03-15 15:59:12', '双皮奶', '双皮奶是广东传统甜品之一，口感细腻，香甜可口。双皮奶的历史可以追溯到清朝时期。', 'http://localhost:8080/lingnanyingshiwenhua/upload/shuangpinai.webp', '<p>	双皮奶，是一种粤式甜品。清朝时起源自佛山顺德，用水牛奶做原料。现双皮奶产品店遍布于广东、澳门、香港等全国各地。&nbsp;</p><p>制作双皮奶的环节都很讲究，先将牛奶煮热（不能煮沸，否则不易结皮），趁热倒在碗里，热气会使鲜牛奶表层结出奶皮，用筷子将奶皮刺穿，缓缓将碗里的奶倒出，加入适量蛋清、白砂糖搅匀，再沿着碗边慢慢倒回原来的碗里，原来的奶皮会慢慢浮起；然后放到蒸锅上蒸，不久后结出一层皮，这样就形成了二层皮，上层奶皮甘香，下层奶皮香滑润口。“双皮奶”有冷热两种吃法，热食温润暖胃，冷食则甜香嫩滑。</p><p>2018年，双皮奶制作技艺被列入广东省第七批省级非物质文化遗产代表性项目名录。</p>');
INSERT INTO `news` VALUES (112, '2021-03-15 15:59:12', '煲仔饭', '煲仔饭是广东传统小吃之一，以米饭和各种食材为主要原料，制作精细，口感鲜美。煲仔饭的历史可以追溯到清朝时期。', 'http://localhost:8080/lingnanyingshiwenhua/upload/baozaifan.webp', '<p>	煲仔饭，又称瓦煲饭，是一道极具特色的传统粤菜，在广东地区及全国各地都深受食客喜爱。“煲仔” 在粤语中意为小砂锅，煲仔饭正是用这种小砂锅煮成的米饭，在煮的过程中，将腌制好的肉类、海鲜或蔬菜等食材铺于米饭之上，利用砂锅的余热将食材焖熟，让食材的香味充分渗透到米饭中。</p><p>煲仔饭的历史颇为悠久，可追溯至两千多年前的中原地区。那时，人们用陶制炊具煮饭，随着中原文化南迁，这种烹饪方式与当地食材、口味相结合，逐渐演变成如今的煲仔饭。其特色鲜明，米饭粒粒分明，吸收了食材的鲜香，口感软糯又富有嚼劲。锅底那一层金黄酥脆的锅巴更是精华所在，焦香四溢，令人回味无穷。</p><p>制作煲仔饭，食材选择多样。常见的有腊味（如腊肠、腊肉）、排骨、鸡肉、牛肉等，还可搭配香菇、青菜、鸡蛋等，丰富口感与营养。以经典腊味煲仔饭为例，需选用优质大米，将其洗净后放入砂锅中，加适量水开始煮制。待米饭煮至半熟，码上切成薄片的腊肠和腊肉，继续小火焖煮。期间，腊肠和腊肉的油脂慢慢渗出，滴落在米饭上，使其增添醇厚香味。最后，沿砂锅边缘淋上少许食用油，利用砂锅余热将锅巴焗至金黄。食用时，再浇上特制的酱汁，豉香与肉香、米香完美融合，给味蕾带来一场极致盛宴。无论是作为家常美食，还是在餐厅享用，煲仔饭都以其独特风味，让人唇齿留香，难以忘怀。</p>');
INSERT INTO `news` VALUES (113, '2021-03-15 15:59:12', '糯米鸡', '糯米鸡是广东传统小吃之一，以糯米和鸡肉为主要原料，制作精细，口感鲜美。糯米鸡的历史可以追溯到明朝时期。', 'http://localhost:8080/lingnanyingshiwenhua/upload/nuomiji.webp', '<p>    糯米鸡，发源于中国<a href=\"https://baike.baidu.com/item/%E5%B9%BF%E4%B8%9C%E7%9C%81/132473?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">广东省</a><a href=\"https://baike.baidu.com/item/%E5%B9%BF%E5%B7%9E%E5%B8%82/21808?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">广州市</a>，所属<a href=\"https://baike.baidu.com/item/%E7%B2%A4%E8%8F%9C%E7%B3%BB/692339?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">粤菜系</a>。该小吃的制法是在<a href=\"https://baike.baidu.com/item/%E7%B3%AF%E7%B1%B3/118479?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">糯米</a>里面放入<a href=\"https://baike.baidu.com/item/%E9%B8%A1%E8%82%89/9661436?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">鸡肉</a>、<a href=\"https://baike.baidu.com/item/%E5%8F%89%E7%83%A7%E8%82%89/1809685?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">叉烧肉</a>、<a href=\"https://baike.baidu.com/item/%E6%8E%92%E9%AA%A8/2135091?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">排骨</a>、<a href=\"https://baike.baidu.com/item/%E5%92%B8%E8%9B%8B%E9%BB%84/9178910?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">咸蛋黄</a>、<a href=\"https://baike.baidu.com/item/%E5%86%AC%E8%8F%87/5897553?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">冬菇</a>等馅料，然后以<a href=\"https://baike.baidu.com/item/%E8%8D%B7%E5%8F%B6%E5%8C%85/2521903?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">荷叶包</a>实放到蒸具蒸熟；糯米鸡入口充满着<a href=\"https://baike.baidu.com/item/%E8%8D%B7%E5%8F%B6/46016?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">荷叶</a>的清香，咀嚼时黏牙并带有着<a href=\"https://baike.baidu.com/item/%E9%B8%A1%E8%82%89/9661436?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">鸡肉</a>的肉香。</p><p>	<span style=\"color: rgb(51, 51, 51);\">相传糯米鸡起源是解放前广州的夜市，最初是以碗盖着蒸熟而成，后来为小贩为方便肩挑出售，改为以荷叶包裹。古代糯米鸡以糯米、</span>	<a href=\"https://baike.baidu.com/item/%E7%91%B6%E6%9F%B1/93822?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">瑶柱</a>	<span style=\"color: rgb(51, 51, 51);\">、</span>	<a href=\"https://baike.baidu.com/item/%E8%99%BE%E5%B9%B2/8554287?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">虾干</a>	<span style=\"color: rgb(51, 51, 51);\">粒，或去骨的</span>	<a href=\"https://baike.baidu.com/item/%E9%B8%A1%E7%BF%85/8743515?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">鸡翅</a>	<span style=\"color: rgb(51, 51, 51);\">等作馅料精制而成。传统的糯米鸡的份量较大，足有三四两米，吃一个糯米鸡基本就是半顿饭量。因此，1980年代起的广东酒楼推出材料相同，而体积小一半的“珍</span>	<a href=\"https://baike.baidu.com/item/%E7%8F%A0%E9%B8%A1/3634798?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">珠鸡</a>	<span style=\"color: rgb(51, 51, 51);\">”。</span></p>');
INSERT INTO `news` VALUES (114, '2021-03-15 15:59:12', '肠粉', '肠粉(英文:steamed vermicelli roll)是一种广东非常出名的传统小吃，属于粤菜系，起源于广州。', 'http://localhost:8080/lingnanyingshiwenhua/upload/changfeng.webp', '<p>	肠粉起源于广州，早在清代末期，广州街头上就已经听到卖肠粉的叫卖声。由于味道鲜美，价钱便宜，所以在广州十分畅销，成为一道大众化的小食。那时候，肠粉分咸、甜两种，咸肠粉的馅料主要有猪肉、牛肉、虾仁、猪肝等，而甜肠粉的馅料则主要是糖浸的蔬果，再拌上炒香芝麻。</p><p>	肠粉已经是广东著名的传统特色美食之一，肠粉分咸、甜两种，咸肠粉的馅料主要有<a href=\"https://baike.baidu.com/item/%E7%8C%AA%E8%82%89/486463?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">猪肉</a>、<a href=\"https://baike.baidu.com/item/%E7%89%9B%E8%82%89/1008026?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">牛肉</a>、虾仁、<a href=\"https://baike.baidu.com/item/%E7%8C%AA%E8%82%9D/1157317?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">猪肝</a>等，而甜肠粉的馅料则主要是糖浸的<a href=\"https://baike.baidu.com/item/%E8%94%AC%E6%9E%9C/10788173?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">蔬果</a>，再拌上炒香芝麻。肠粉按流派分主要分为两种，一种是<a href=\"https://baike.baidu.com/item/%E5%B8%83%E6%8B%89%E8%82%A0%E7%B2%89/7449055?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">布拉肠粉</a>，另一种是<a href=\"https://baike.baidu.com/item/%E6%8A%BD%E5%B1%89%E5%BC%8F%E8%82%A0%E7%B2%89/16020043?fromModule=lemma_inlink\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\">抽屉式肠粉</a>，由于使用的制作工具不同，所以导致做出的肠粉都不相同。</p>');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'shangpinxinxi' COMMENT '商品表名',
  `userid` bigint NOT NULL COMMENT '用户id',
  `goodid` bigint NOT NULL COMMENT '商品id',
  `goodname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `buynumber` int NOT NULL COMMENT '购买数量',
  `price` float NOT NULL DEFAULT 0 COMMENT '价格/积分',
  `discountprice` float NULL DEFAULT 0 COMMENT '折扣价格',
  `total` float NOT NULL DEFAULT 0 COMMENT '总价格/总积分',
  `discounttotal` float NULL DEFAULT 0 COMMENT '折扣总价格',
  `type` int NULL DEFAULT 1 COMMENT '支付类型',
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderid`(`orderid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1741557306266 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1616119265758, '2021-03-19 10:01:05', '2021319101548782360', 'shangpinxinxi', 1616119159806, 42, '商品名称2', 'http://localhost:8080/lingnanyingshiwenhua/upload/changfeng.webp', 3, 99.9, 99.9, 799.2, 299.7, 1, '已退款', '北京市丰台区花乡乡南四环西路辅路北京旧车市场');
INSERT INTO `orders` VALUES (1616119266411, '2021-03-19 10:01:05', '2021319101548306282', 'shangpinxinxi', 1616119159806, 41, '商品名称1', 'http://localhost:8080/lingnanyingshiwenhua/upload/baiqieji.jpg', 5, 99.9, 99.9, 799.2, 499.5, 1, '已退款', '北京市丰台区花乡乡南四环西路辅路北京旧车市场');
INSERT INTO `orders` VALUES (1616119339792, '2021-03-19 10:02:19', '20213191021953481576', 'shangpinxinxi', 1616119159806, 42, '商品名称2', 'http://localhost:8080/lingnanyingshiwenhua/upload/changfeng.webp', 3, 99.9, 99.9, 799.2, 299.7, 1, '已退款', '北京市丰台区花乡乡南四环西路辅路北京旧车市场');
INSERT INTO `orders` VALUES (1616119340016, '2021-03-19 10:02:19', '20213191021952986014', 'shangpinxinxi', 1616119159806, 41, '商品名称1', 'http://localhost:8080/lingnanyingshiwenhua/upload/baiqieji.jpg', 5, 99.9, 99.9, 799.2, 499.5, 1, '已完成', '北京市丰台区花乡乡南四环西路辅路北京旧车市场');
INSERT INTO `orders` VALUES (1741557245858, '2025-03-10 05:54:05', '2025310554571110717', 'shangpinxinxi', 1728757242947, 41, '肠粉', 'http://localhost:8080/lingnanyingshiwenhua/upload/changfeng.webp', 1, 99.9, 99.9, 199.8, 99.9, 1, '已退款', '广东省广州市白云区广州理工学院');
INSERT INTO `orders` VALUES (1741557245989, '2025-03-10 05:54:05', '2025310554570919481', 'shangpinxinxi', 1728757242947, 42, '白切鸡', 'http://localhost:8080/lingnanyingshiwenhua/upload/baiqieji.jpg', 1, 99.9, 99.9, 199.8, 99.9, 1, '未支付', '广东省广州市白云区广州理工学院');
INSERT INTO `orders` VALUES (1741557247640, '2025-03-10 05:54:07', '202531055472664301', 'shangpinxinxi', 1728757242947, 41, '肠粉', 'http://localhost:8080/lingnanyingshiwenhua/upload/changfeng.webp', 1, 99.9, 99.9, 199.8, 99.9, 1, '未支付', '广东省广州市白云区广州理工学院');
INSERT INTO `orders` VALUES (1741557247844, '2025-03-10 05:54:07', '202531055472870843', 'shangpinxinxi', 1728757242947, 42, '白切鸡', 'http://localhost:8080/lingnanyingshiwenhua/upload/baiqieji.jpg', 1, 99.9, 99.9, 199.8, 99.9, 1, '未支付', '广东省广州市白云区广州理工学院');
INSERT INTO `orders` VALUES (1741557305973, '2025-03-10 05:55:05', '2025310555537305556', 'shangpinxinxi', 1728757242947, 42, '白切鸡', 'http://localhost:8080/lingnanyingshiwenhua/upload/baiqieji.jpg', 1, 99.9, 99.9, 199.8, 99.9, 1, '未支付', '广东省广州市白云区广州理工学院');
INSERT INTO `orders` VALUES (1741557306265, '2025-03-10 05:55:05', '2025310555537530672', 'shangpinxinxi', 1728757242947, 41, '肠粉', 'http://localhost:8080/lingnanyingshiwenhua/upload/changfeng.webp', 1, 99.9, 99.9, 199.8, 99.9, 1, '已完成', '广东省广州市白云区广州理工学院');

-- ----------------------------
-- Table structure for shangpinfenlei
-- ----------------------------
DROP TABLE IF EXISTS `shangpinfenlei`;
CREATE TABLE `shangpinfenlei`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangpinfenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品分类',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shangpinfenlei`(`shangpinfenlei` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1616118982314 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shangpinfenlei
-- ----------------------------
INSERT INTO `shangpinfenlei` VALUES (21, '2021-03-15 15:59:12', '广府菜系');
INSERT INTO `shangpinfenlei` VALUES (22, '2021-03-15 15:59:12', '潮州菜系');
INSERT INTO `shangpinfenlei` VALUES (23, '2021-03-15 15:59:12', '客家菜系');

-- ----------------------------
-- Table structure for shangpinpingjia
-- ----------------------------
DROP TABLE IF EXISTS `shangpinpingjia`;
CREATE TABLE `shangpinpingjia`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dingdanbianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `shangpinmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `shangpinfenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类',
  `pinpai` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `pingfen` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评分',
  `pingjianeirong` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价内容',
  `tianjiatupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加图片',
  `pingjiariqi` date NULL DEFAULT NULL COMMENT '评价日期',
  `yonghuming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `lianxidianhua` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `sfsh` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1616119470779 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评价' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shangpinpingjia
-- ----------------------------
INSERT INTO `shangpinpingjia` VALUES (1616119470778, '2021-03-19 10:04:29', '20213191021952986014', '商品名称1', '分类1', '品牌1', '5', '123123', 'http://localhost:8080/lingnanyingshiwenhua/upload/1616058000162.jpg', '2021-03-22', '123', '12312312312', '是', '748789789');

-- ----------------------------
-- Table structure for shangpinxinxi
-- ----------------------------
DROP TABLE IF EXISTS `shangpinxinxi`;
CREATE TABLE `shangpinxinxi`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangpinmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `shangpinfenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品分类',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `biaoqian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `pinpai` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `shangpinxiangqing` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情',
  `clicktime` datetime NULL DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int NULL DEFAULT 0 COMMENT '点击次数',
  `price` float NOT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1616119025191 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shangpinxinxi
-- ----------------------------
INSERT INTO `shangpinxinxi` VALUES (41, '2021-03-15 15:59:12', '烤乳猪', '广府菜系', 'http://localhost:8080/lingnanyingshiwenhua/upload/kaoruzhu.jpg', '荤菜', '广式', '<p>烤乳猪是广州最著名的特色菜，并且是“满汉全席”中的主打菜肴之一。早在西周时此菜已被列为“八珍”之一，那时称为“炮豚”。</p>', '2025-03-13 20:38:50', 33, 99.9);
INSERT INTO `shangpinxinxi` VALUES (42, '2021-03-15 15:59:12', '白切鸡', '广府菜系', 'http://localhost:8080/lingnanyingshiwenhua/upload/baiqieji.jpg', '荤菜', '广式', '<p>白斩鸡又叫白切鸡，是一道中华民族特色菜肴，是一道经典的粤菜，后来在南方菜系中普遍存在。始于清代的民间酒店，因烹鸡时不加调味白煮而成，食用时随吃随斩，故称“白斩鸡”。</p>', '2025-03-13 14:46:15', 53, 99.9);
INSERT INTO `shangpinxinxi` VALUES (43, '2021-03-15 15:59:12', '蚝仔烙', '潮州菜系', 'http://localhost:8080/lingnanyingshiwenhua/upload/haolao.webp', '荤菜', '潮式', '<p>潮汕蚝仔烙，鲜蚝搭配薯粉、鸭蛋，煎至金黄酥脆，外香内嫩，是潮汕传统美食的代表。</p>', '2025-03-13 19:35:41', 27, 99.9);
INSERT INTO `shangpinxinxi` VALUES (44, '2021-03-15 15:59:12', '鲍鱼砂锅粥', '潮州菜系', 'http://localhost:8080/lingnanyingshiwenhua/upload/baoyuzhou.webp', '荤菜', '潮式', '<p>鲍鱼砂锅粥，鲍香米糯，砂锅慢煮，鲜味浓郁，尽显粤式粥品的奢华与细腻。</p>', '2025-03-06 21:47:15', 37, 99.9);
INSERT INTO `shangpinxinxi` VALUES (45, '2021-03-15 15:59:12', '盐焗鸡', '客家菜系', 'http://localhost:8080/lingnanyingshiwenhua/upload/yanjuji.jpg', '荤菜', '客家', '<p>咸香是客家菜的特色，而盐焗鸡最好地体现了这一点。皮爽肉滑骨出味，故有天下第一鸡的称道。东江菜也因为有盐焗鸡而在以食鸡闻名的广东与潮州菜、广州菜齐名。</p>', '2025-03-09 20:42:08', 23, 99.9);
INSERT INTO `shangpinxinxi` VALUES (46, '2021-03-15 15:59:12', '酿豆腐', '客家菜系', 'http://localhost:8080/lingnanyingshiwenhua/upload/niangdoufu.jpg', '素菜', '客家', '<p>万物皆可酿的客家菜的代表，鲜嫩滑香，营养丰富。一家煮，十家香，是客家逢年过节的保留菜式。</p>', '2025-03-09 20:44:18', 18, 99.9);

-- ----------------------------
-- Table structure for shenqing
-- ----------------------------
DROP TABLE IF EXISTS `shenqing`;
CREATE TABLE `shenqing`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yh_types` bigint NULL DEFAULT NULL COMMENT '申请人',
  `shenqing_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '申请时间',
  `sf_types` tinyint NULL DEFAULT NULL COMMENT '是否同意',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shenqing
-- ----------------------------
INSERT INTO `shenqing` VALUES (1, 11, '2021-03-18 11:37:07', 2);
INSERT INTO `shenqing` VALUES (2, 12, '2021-03-18 12:18:08', 2);
INSERT INTO `shenqing` VALUES (3, 1616119159806, '2021-03-19 02:08:30', 2);

-- ----------------------------
-- Table structure for storeup
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `refid` bigint NULL DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1741557837894 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of storeup
-- ----------------------------
INSERT INTO `storeup` VALUES (1616119173446, '2021-03-19 09:59:32', 1616119159806, 41, 'shangpinxinxi', '商品名称1', 'http://localhost:8080/lingnanyingshiwenhua/upload/baiqieji.jpg');
INSERT INTO `storeup` VALUES (1705025244391, '2024-01-12 10:07:23', 11, 42, 'shangpinxinxi', '商品名称2', 'http://localhost:8080/lingnanyingshiwenhua/upload/baiqieji.jpg');
INSERT INTO `storeup` VALUES (1741557837893, '2025-03-10 06:03:56', 1728757242947, 42, 'shangpinxinxi', '白切鸡', 'http://localhost:8080/lingnanyingshiwenhua/upload/baiqieji.jpg');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 11, '用户1', 'yonghu', '用户', '69duvm381ebng7apt0dvwpocawegmc00', '2021-03-15 16:04:27', '2024-01-12 03:07:03');
INSERT INTO `token` VALUES (2, 1, 'abo', 'users', '管理员', 'qq9sti3xk5wr1cw2lw4qnhjotnw0od17', '2021-03-15 16:05:48', '2025-03-14 23:25:18');
INSERT INTO `token` VALUES (3, 1614241036888, '1', 'yonghu', '用户', 'w59s1pisbi8g0x8b2ur0mwjdewf0lepf', '2021-03-15 16:18:05', '2021-03-15 09:22:12');
INSERT INTO `token` VALUES (4, 12, '用户2', 'yonghu', '用户', 'dvngx0iiryipy502snsik1pxdpntl77l', '2021-03-18 20:17:48', '2021-03-18 13:17:49');
INSERT INTO `token` VALUES (5, 1616119159806, '123', 'yonghu', '用户', 'x2klu2uj2kjckkrsdzc21e6mgrwklife', '2021-03-19 09:59:24', '2021-03-19 03:03:40');
INSERT INTO `token` VALUES (6, 1728757242947, 'yonghu1', 'yonghu', '用户', 'g1pfxdeo820h3ru2an911a1z78djp7ja', '2024-10-13 02:20:56', '2025-03-14 23:16:46');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '123456', '管理员', '2021-03-15 15:59:12');

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `touxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `lianxidianhua` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `money` float NULL DEFAULT 0 COMMENT '余额',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份',
  `xiangqing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人介绍',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yonghuming`(`yonghuming` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1728757242948 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES (11, '2021-03-15 15:59:12', '用户1', '123456', '姓名1', 'http://localhost:8080/lingnanyingshiwenhua/upload/1616058056174.jpg', '男', '18000000000', 6431, '管理员', '<p>个人介绍1</p>');
INSERT INTO `yonghu` VALUES (12, '2021-03-15 15:59:12', '用户2', '123456', '222', 'http://localhost:8080/lingnanyingshiwenhua/upload/1616058000162.jpg', '男', '18000000001', 100, '管理员', '<p>个人介绍2</p>');
INSERT INTO `yonghu` VALUES (13, '2021-03-15 15:59:12', '用户3', '123456', '姓名3', 'http://localhost:8080/lingnanyingshiwenhua/upload/1615036201218.jpg', '男', '18000000002', 100, '用户', '<p>个人介绍3</p>');
INSERT INTO `yonghu` VALUES (14, '2021-03-15 15:59:12', '用户4', '123456', '姓名4', 'http://localhost:8080/lingnanyingshiwenhua/upload/1615036215497.jpg', '男', '18000000003', 100, '用户', '<p>个人介绍4</p>');
INSERT INTO `yonghu` VALUES (15, '2021-03-15 15:59:12', '用户5', '123456', '姓名5', 'http://localhost:8080/lingnanyingshiwenhua/upload/1615036231399.jpg', '男', '18000000004', 100, '用户', '<p>个人介绍5</p>');
INSERT INTO `yonghu` VALUES (16, '2021-03-15 15:59:12', '用户6', '123456', '姓名6', 'http://localhost:8080/lingnanyingshiwenhua/upload/1615036258696.jpg', '男', '18000000005', 100, '用户', '<p>个人介绍6</p>');
INSERT INTO `yonghu` VALUES (1616119159806, '2021-03-19 09:59:19', '123', '123', '123', 'http://localhost:8080/lingnanyingshiwenhua/upload/1616119207424.jpg', '男', '12312312312', 10799.2, '管理员', '<p>qweqweqw</p>');
INSERT INTO `yonghu` VALUES (1728757242947, '2024-10-13 02:20:42', 'yonghu1', '123456', 'hhr', 'http://localhost:8080/lingnanyingshiwenhua/upload/1615036215497.jpg', '男', '10086100861', 199.99, '用户', NULL);

SET FOREIGN_KEY_CHECKS = 1;
