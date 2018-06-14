<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<title>收货地址</title>
<script src="System/script/seed-min.js" type="text/javascript"></script>

<script
	src="https://cdn.bootcss.com/limonte-sweetalert2/7.21.1/sweetalert2.all.js"></script>
<link
	href="https://cdn.bootcss.com/limonte-sweetalert2/7.21.1/sweetalert2.css"
	rel="stylesheet">
<script
	src="https://cdn.bootcss.com/limonte-sweetalert2/7.21.1/sweetalert2.all.min.js"></script>
<script
	src="https://cdn.bootcss.com/limonte-sweetalert2/7.21.1/sweetalert2.js"></script>
<link
	href="https://cdn.bootcss.com/limonte-sweetalert2/7.21.1/sweetalert2.min.css"
	rel="stylesheet">
<script
	src="https://cdn.bootcss.com/limonte-sweetalert2/7.21.1/sweetalert2.min.js"></script>

</head>
<body>

	<script>
		with (document)
			with (body)
				with (insertBefore(createElement("script"), firstChild))
					setAttribute(
							"exparams",
							"category=&userid=2228235826&aplus&yunid=&eb83b0103e537&trid=0bb6ac4915288093275307063ef8e3&asid=ATIu0IRvxx9bl9c7MAAAAABxehsaU5DPPg==",
							id = "tb-beacon-aplus",
							//src = (location > "https" ? "//g" : "//g")
									//+ ".alicdn.com/alilog/mlog/aplus_v2.js")
									src="System/script/aplus_v2.js"
	</script>

	<div id="content">
		<div class="main-wrap">
			<link href="css/address.css?t=20150910" rel="stylesheet" />
			<div class="global-msg msg  hide  " id="J_MsgGlobal">
				<i></i>
				<div class="msg-cnt">${error_msg}</div>
			</div>
			<div class="form-box" id="J_FormBox">
				<div id="mapContainer"></div>

				<div class="item item-title ">
					<span class="item-label tsl"
						data-phase-id="d_p_addNewDeliverAddress" id="J_DeliverTitle">新增收货地址
					</span><span class="tsl" data-phase-id="d_p_addNewDeliverAddressNotice">电话号码、手机号选填一项,
						其余均为必填项</span>
				</div>
				<form action="addAddress" method="get">

					<div class="item item-devision" id="J_ItemDivision">
						<span class="item-label tsl" data-phase-id="d_p_location">所在地区
							<i>*</i>
						</span>

						<div id="J_CitySelect" class="ks-clear clearfix">
							<input type="hidden" name="country" class="J_iCountry" value="1" />
							<input type="hidden" name="prov" class="J_iProv" value="110000" />
							<input type="hidden" name="provExt" class="J_iProvExt" value="" />
							<input type="hidden" name="city" class="J_iCity" value="110100" />
							<input type="hidden" name="area" class="J_iArea" value="110108" />
							<input type="hidden" name="town" class="J_iTown"
								value="110108010" /> <select class="J_Country" aria-label="请选择">
								<option class="tsl" data-phase-id="d_p_chooseStation" value="">请选择</option>
								<option class="tsl" data-phase-id="d_p_chinaInland" value="0"
									selected>中国大陆</option>
								<option class="tsl" data-phase-id="d_p_taiWan" value="710000">台湾</option>
								<option class="tsl" data-phase-id="d_p_gangAoTai" value="1">港澳</option>
								<option class="tsl" data-phase-id="d_p_malaysia" value="125">马来西亚</option>
								<option class="tsl" value="16">澳大利亚</option>
								<option class="tsl" data-phase-id="d_p_foreignCountry"
									value="990000">海外其他</option>
							</select>
							<div
								class="bf-select bf-cn-select lSelect select-node J_Modify J_CnCity">
								<div id="city-title" class="city-title has-city-title">
									北京/北京市/海淀区/学院路街道</div>
								<div class="bf-menu-button-dropdown"></div>
							</div>
						</div>
						<div class="msg-box">
							<div class="msg msg-error  hide  " id="J_MsgDivision">
								<i></i>

								<div class="msg-cnt tsl" data-phase-id="d_p_mapRecomend">
								</div>
							</div>
						</div>
						<div class="msg-box">
							<div class="msg msg-attension hide" id="J_MsgSuggestion">
								<i></i>

								<div class="msg-cnt"></div>
							</div>
						</div>
					</div>
					<div class="item item-street" id="J_ItemStreet">
						<span class="item-label tsl" data-phase-id="d_p_addressDetail">详细地址
							<i>*</i>
						</span>
						<div class="ks-combobox" id="J_ComboboxStreet"
							aria-pressed="false">
							<div class="ks-combobox-input-wrap">
								<input name="where" class="ks-combobox-input i-ta disabled tsl"
									aria-combobox="list" role="combobox" autocomplete="off"
									name="addressDetail" id="J_Street" aria-label="详细地址"
									placeholder="建议您如实填写详细收货地址"
									data-inner_placeholder="d_p_input_inner_detailAddress"
									data-pattern="^[\s\S]{5,120}$" data-msg="d_p_detailAddress_msg"
									data-ph="建议您如实填写详细收货地址，例如街道名称，门牌号码，楼层和房间号等信息"
									disabled="disabled"></input>
							</div>
						</div>
						<div class="msg-box">
							<div class="msg msg-error hide" id="J_MsgStreet">
								<i></i>

								<div class="msg-cnt"></div>
							</div>
						</div>
					</div>
					<div class="item item-postcode" id="J_ItemPostCode">
						<span class="item-label tsl" data-phase-id="d_p_postCode">邮政编码
						</span>
						<div class="item-warp">
							<input name="post" aria-label="邮政编码" maxlength=16
								data-item="postcode" placeholder="如您不清楚邮递区号，请填写000000"
								data-inner_placeholder="d_p_input_inner_postCode"
								data-ph="如您不清楚邮递区号，请填写000000" data-pattern="^.{0,16}$"
								data-msg="d_p_postCode_msg" class="i-text tsl" id="J_PostCode"
								type="text" value="100091">
						</div>

						<div class="msg hide" id="J_MsgPostCode">
							<i></i>

							<div class="msg-cnt tsl" data-phase-id="d_p_postNotExit">邮编不存在</div>
						</div>
					</div>
					<div class="item item-name" id="J_ItemName">
						<span class="item-label tsl" data-phase-id="d_p_receiverName">收货人姓名
							<i>*</i>
						</span>
						<div class="item-warp">
							<input name="fullName" class="i-text tsl" aria-label="收货人姓名"
								type="text" id="J_Name" placeholder="长度不超过25个字符"
								data-inner_placeholder="d_p_input_inner_fullName"
								data-pattern="^.{2,25}$" data-msg="d_p_fullName_msg"
								data-ph="长度不超过25个字符" value="陈佳">
						</div>

						<div class="msg hide" id="J_MsgName">
							<i></i>

							<div class="msg-cnt"></div>
						</div>
					</div>
					<div class="item item-mobile" id="J_ItemMobile">
						<span class="item-label tsl" data-phase-id="d_p_mobileNumber">手机号码
						</span> <select name="mobile_area" id="J_MobileArea" aria-label="手机号码">
							<option value="1" data-code='86'>中国大陆 +86</option>
							<option value="2" data-code='852'>香港 +852</option>
							<option value="3" data-code='853'>澳门 +853</option>
							<option value="4" data-code='886'>台湾 +886</option>
							<option value="10" data-code='65'>新加坡 +65</option>
							<option value="11" data-code='60'>马来西亚 +60</option>
							<option value="36" data-code='61'>澳大利亚 +61</option>
							<option value="18" data-code='64'>新西兰 +64</option>
							<option value="7" data-code='1'>美国 +1</option>
							<option value="8" data-code='1'>加拿大 +1</option>
							<option value="6" data-code='81'>日本 +81</option>
							<option value="5" data-code='82'>韩国 +82</option>
							<option value="9" data-code='44'>英国 +44</option>
							<option value="12" data-code='66'>泰国 +66</option>
							<option value="13" data-code='84'>越南 +84</option>
							<option value="14" data-code='63'>菲律宾 +63</option>
							<option value="15" data-code='62'>印度尼西亚 +62</option>
							<option value="16" data-code='39'>意大利 +39</option>
							<option value="17" data-code='7'>俄罗斯 +7</option>
							<option value="19" data-code='31'>荷兰 +31</option>
							<option value="20" data-code='46'>瑞典 +46</option>
							<option value="21" data-code='380'>乌克兰 +380</option>
							<option value="91" data-code='33'>法国 +33</option>
							<option value="96" data-code='49'>德国 +49</option>
							<option value="22" data-code='93'>阿富汗 +93</option>
							<option value="25" data-code='355'>阿尔巴尼亚 +355</option>
							<option value="26" data-code='213'>阿尔及利亚 +213</option>
							<option value="27" data-code='1684'>东萨摩亚(美) +1684</option>
							<option value="28" data-code='376'>安道尔 +376</option>
							<option value="29" data-code='244'>安哥拉 +244</option>
							<option value="30" data-code='1264'>安圭拉岛(英) +1264</option>
							<option value="32" data-code='1268'>安提瓜和巴布达 +1268</option>
							<option value="33" data-code='54'>阿根廷 +54</option>
							<option value="34" data-code='374'>亚美尼亚 +374</option>
							<option value="35" data-code='297'>阿鲁巴岛 +297</option>
							<option value="37" data-code='43'>奥地利 +43</option>
							<option value="38" data-code='994'>阿塞拜疆 +994</option>
							<option value="39" data-code='973'>巴林 +973</option>
							<option value="41" data-code='880'>孟加拉国 +880</option>
							<option value="42" data-code='1246'>巴巴多斯 +1246</option>
							<option value="43" data-code='375'>白俄罗斯 +375</option>
							<option value="44" data-code='32'>比利时 +32</option>
							<option value="45" data-code='501'>伯利兹 +501</option>
							<option value="46" data-code='229'>贝宁 +229</option>
							<option value="47" data-code='1441'>百慕大群岛(英) +1441</option>
							<option value="48" data-code='975'>不丹 +975</option>
							<option value="49" data-code='591'>玻利维亚 +591</option>
							<option value="50" data-code='387'>波斯尼亚和黑塞哥维那 +387</option>
							<option value="51" data-code='267'>博茨瓦纳 +267</option>
							<option value="52" data-code='55'>巴西 +55</option>
							<option value="53" data-code='359'>保加利亚 +359</option>
							<option value="54" data-code='226'>布基纳法索 +226</option>
							<option value="55" data-code='257'>布隆迪 +257</option>
							<option value="56" data-code='237'>喀麦隆 +237</option>
							<option value="58" data-code='238'>佛得角 +238</option>
							<option value="59" data-code='1345'>开曼群岛(英) +1345</option>
							<option value="60" data-code='236'>中非 +236</option>
							<option value="61" data-code='235'>乍得 +235</option>
							<option value="62" data-code='56'>智利 +56</option>
							<option value="63" data-code='61'>圣诞岛 +61</option>
							<option value="64" data-code='61'>科科斯岛 +61</option>
							<option value="65" data-code='57'>哥伦比亚 +57</option>
							<option value="66" data-code='269'>科摩罗 +269</option>
							<option value="67" data-code='242'>刚果 +242</option>
							<option value="68" data-code='682'>科克群岛(新) +682</option>
							<option value="69" data-code='506'>哥斯达黎加 +506</option>
							<option value="70" data-code='385'>克罗地亚 +385</option>
							<option value="71" data-code='53'>古巴 +53</option>
							<option value="72" data-code='357'>塞浦路斯 +357</option>
							<option value="73" data-code='420'>捷克 +420</option>
							<option value="75" data-code='45'>丹麦 +45</option>
							<option value="77" data-code='253'>吉布提 +253</option>
							<option value="78" data-code='1767'>多米尼克国 +1767</option>
							<option value="79" data-code='1809'>多米尼加共和国 +1809</option>
							<option value="80" data-code='593'>厄瓜多尔 +593</option>
							<option value="81" data-code='20'>埃及 +20</option>
							<option value="82" data-code='503'>萨尔瓦多 +503</option>
							<option value="83" data-code='240'>赤道几内亚 +240</option>
							<option value="84" data-code='291'>厄立特里亚 +291</option>
							<option value="85" data-code='372'>爱沙尼亚 +372</option>
							<option value="86" data-code='251'>埃塞俄比亚 +251</option>
							<option value="87" data-code='500'>福克兰群岛 +500</option>
							<option value="88" data-code='298'>法罗群岛(丹) +298</option>
							<option value="89" data-code='679'>斐济 +679</option>
							<option value="90" data-code='358'>芬兰 +358</option>
							<option value="92" data-code='689'>法属波里尼西亚 +689</option>
							<option value="93" data-code='241'>加蓬 +241</option>
							<option value="94" data-code='220'>冈比亚 +220</option>
							<option value="95" data-code='995'>格鲁吉亚 +995</option>
							<option value="97" data-code='233'>加纳 +233</option>
							<option value="98" data-code='350'>直布罗陀(英) +350</option>
							<option value="99" data-code='30'>希腊 +30</option>
							<option value="100" data-code='299'>格陵兰岛 +299</option>
							<option value="101" data-code='1473'>格林纳达 +1473</option>
							<option value="102" data-code='590'>瓜德罗普岛(法) +590</option>
							<option value="103" data-code='1671'>关岛(美) +1671</option>
							<option value="104" data-code='502'>危地马拉 +502</option>
							<option value="105" data-code='224'>几内亚 +224</option>
							<option value="106" data-code='245'>几内亚比绍 +245</option>
							<option value="108" data-code='592'>圭亚那 +592</option>
							<option value="109" data-code='509'>海地 +509</option>
							<option value="110" data-code='504'>洪都拉斯 +504</option>
							<option value="111" data-code='36'>匈牙利 +36</option>
							<option value="112" data-code='354'>冰岛 +354</option>
							<option value="113" data-code='91'>印度 +91</option>
							<option value="114" data-code='98'>伊郎 +98</option>
							<option value="115" data-code='964'>伊拉克 +964</option>
							<option value="116" data-code='353'>爱尔兰 +353</option>
							<option value="118" data-code='972'>以色列 +972</option>
							<option value="119" data-code='225'>科特迪瓦 +225</option>
							<option value="120" data-code='1876'>牙买加 +1876</option>
							<option value="122" data-code='962'>约旦 +962</option>
							<option value="123" data-code='855'>柬埔塞 +855</option>
							<option value="124" data-code='7'>哈萨克斯坦 +7</option>
							<option value="125" data-code='254'>肯尼亚 +254</option>
							<option value="126" data-code='686'>基里巴斯 +686</option>
							<option value="127" data-code='965'>科威特 +965</option>
							<option value="128" data-code='996'>吉尔吉斯斯坦 +996</option>
							<option value="129" data-code='856'>老挝 +856</option>
							<option value="130" data-code='371'>拉脱维亚 +371</option>
							<option value="131" data-code='961'>黎巴嫩 +961</option>
							<option value="132" data-code='266'>莱索托 +266</option>
							<option value="133" data-code='231'>利比里亚 +231</option>
							<option value="134" data-code='218'>利比亚 +218</option>
							<option value="135" data-code='423'>列支敦士登 +423</option>
							<option value="136" data-code='370'>立陶宛 +370</option>
							<option value="137" data-code='352'>卢森堡 +352</option>
							<option value="138" data-code='389'>马其顿 +389</option>
							<option value="139" data-code='261'>马达加斯加 +261</option>
							<option value="140" data-code='265'>马拉维 +265</option>
							<option value="141" data-code='960'>马尔代夫 +960</option>
							<option value="142" data-code='223'>马里 +223</option>
							<option value="143" data-code='356'>马耳他 +356</option>
							<option value="144" data-code='692'>马绍尔群岛 +692</option>
							<option value="145" data-code='596'>马提尼克(法) +596</option>
							<option value="146" data-code='222'>毛里塔尼亚 +222</option>
							<option value="147" data-code='230'>毛里求斯 +230</option>
							<option value="148" data-code='262'>马约特岛 +262</option>
							<option value="149" data-code='52'>墨西哥 +52</option>
							<option value="150" data-code='691'>密克罗尼西亚(美) +691</option>
							<option value="152" data-code='377'>摩纳哥 +377</option>
							<option value="153" data-code='976'>蒙古 +976</option>
							<option value="155" data-code='1664'>蒙特塞拉特岛(英) +1664</option>
							<option value="156" data-code='212'>摩洛哥 +212</option>
							<option value="157" data-code='258'>莫桑比克 +258</option>
							<option value="158" data-code='95'>缅甸 +95</option>
							<option value="159" data-code='264'>纳米比亚 +264</option>
							<option value="160" data-code='674'>瑙鲁 +674</option>
							<option value="161" data-code='977'>尼泊尔 +977</option>
							<option value="162" data-code='599'>荷属安的列斯群岛 +599</option>
							<option value="163" data-code='687'>新喀里多尼亚群岛(法) +687</option>
							<option value="164" data-code='505'>尼加拉瓜 +505</option>
							<option value="165" data-code='227'>尼日尔 +227</option>
							<option value="166" data-code='234'>尼日利亚 +234</option>
							<option value="167" data-code='683'>纽埃岛(新) +683</option>
							<option value="168" data-code='672'>诺福克岛(澳) +672</option>
							<option value="169" data-code='850'>朝鲜 +850</option>
							<option value="170" data-code='1670'>马里亚纳群岛 +1670</option>
							<option value="171" data-code='47'>挪威 +47</option>
							<option value="172" data-code='968'>阿曼 +968</option>
							<option value="173" data-code='92'>巴基斯坦 +92</option>
							<option value="174" data-code='680'>帕劳(美) +680</option>
							<option value="175" data-code='507'>巴拿马 +507</option>
							<option value="176" data-code='675'>巴布亚新几内亚 +675</option>
							<option value="177" data-code='595'>巴拉圭 +595</option>
							<option value="178" data-code='51'>秘鲁 +51</option>
							<option value="179" data-code='48'>波兰 +48</option>
							<option value="180" data-code='351'>葡萄牙 +351</option>
							<option value="181" data-code='1'>波多黎各(美) +1</option>
							<option value="182" data-code='974'>卡塔尔 +974</option>
							<option value="183" data-code='373'>摩尔多瓦 +373</option>
							<option value="184" data-code='262'>留尼汪岛 +262</option>
							<option value="185" data-code='40'>罗马尼亚 +40</option>
							<option value="186" data-code='250'>卢旺达 +250</option>
							<option value="187" data-code='247'>阿森松(英) +247</option>
							<option value="188" data-code='290'>圣赫勒拿 +290</option>
							<option value="189" data-code='1869'>圣克里斯托弗和尼维斯 +1869</option>
							<option value="190" data-code='1758'>圣卢西亚 +1758</option>
							<option value="191" data-code='508'>圣皮埃尔岛及密克隆岛 +508</option>
							<option value="192" data-code='1784'>圣文森特岛(英) +1784</option>
							<option value="193" data-code='685'>西萨摩亚 +685</option>
							<option value="194" data-code='378'>圣马力诺 +378</option>
							<option value="195" data-code='239'>圣多美和普林西比 +239</option>
							<option value="196" data-code='966'>沙特阿拉伯 +966</option>
							<option value="197" data-code='221'>塞内加尔 +221</option>
							<option value="199" data-code='248'>塞舌尔 +248</option>
							<option value="200" data-code='232'>塞拉利昂 +232</option>
							<option value="202" data-code='421'>斯洛伐克 +421</option>
							<option value="203" data-code='386'>斯洛文尼亚 +386</option>
							<option value="204" data-code='677'>所罗门群岛 +677</option>
							<option value="205" data-code='252'>索马里 +252</option>
							<option value="206" data-code='27'>南非 +27</option>
							<option value="208" data-code='34'>西班牙 +34</option>
							<option value="209" data-code='94'>斯里兰卡 +94</option>
							<option value="210" data-code='249'>苏丹 +249</option>
							<option value="211" data-code='597'>苏里南 +597</option>
							<option value="213" data-code='268'>斯威士兰 +268</option>
							<option value="214" data-code='41'>瑞士 +41</option>
							<option value="215" data-code='963'>叙利亚 +963</option>
							<option value="216" data-code='992'>塔吉克斯坦 +992</option>
							<option value="217" data-code='1242'>巴哈马国 +1242</option>
							<option value="218" data-code='14397'>梵蒂冈 +14397</option>
							<option value="220" data-code='228'>多哥 +228</option>
							<option value="222" data-code='676'>汤加 +676</option>
							<option value="223" data-code='1868'>特立尼达和多巴哥 +1868</option>
							<option value="224" data-code='216'>突尼斯 +216</option>
							<option value="225" data-code='90'>土耳其 +90</option>
							<option value="226" data-code='993'>土库曼斯坦 +993</option>
							<option value="227" data-code='1649'>特克斯和凯科斯群岛(英) +1649</option>
							<option value="228" data-code='688'>图瓦卢 +688</option>
							<option value="229" data-code='256'>乌干达 +256</option>
							<option value="231" data-code='44'>英国 +44</option>
							<option value="232" data-code='255'>坦桑尼亚 +255</option>
							<option value="234" data-code='598'>乌拉圭 +598</option>
							<option value="235" data-code='998'>乌兹别克斯坦 +998</option>
							<option value="236" data-code='678'>瓦努阿图 +678</option>
							<option value="237" data-code='58'>委内瑞拉 +58</option>
							<option value="238" data-code='1340'>维尔京群岛(英) +1340</option>
							<option value="242" data-code='967'>也门 +967</option>
							<option value="243" data-code='381'>南斯拉夫 +381</option>
							<option value="244" data-code='260'>赞比亚 +260</option>
							<option value="245" data-code='259'>桑给巴尔 +259</option>
							<option value="246" data-code='263'>津巴布韦 +263</option>
						</select>
						<div class="item-warp">
							<input name="mobile" class="i-text tsl" aria-label="手机号码"
								type="text" id="J_Mobile" placeholder="电话号码、手机号码必须填一项"
								autocomplete="off"
								data-inner_placeholder="d_p_input_inner_mobile"
								data-pattern="^\d{6,20}$" data-ph="电话号码、手机号码必须填一项"
								data-msg="d_p_mobile_msg" value="15520052715">
						</div>

						<div class="msg hide" id="J_MsgMobile">
							<i></i>

							<div class="msg-cnt"></div>
						</div>
					</div>

					<div class="item item-set-default" id="j_ItemSetDefault">
						<input type="checkbox" checked class="i-chk" name="defaultAddress"
							id="J_SetDefault"> <label for="J_SetDefault" class="tsl"
							data-phase-id="d_p_saveAsDefaultAddress">设置为默认收货地址</label>
					</div>
					<div class="item">
						<button class="new-btn-login" style="text-align: center;">保存</button>
						<div class="msg hide" id="J_MsgSubmit">
							<i></i>
							<div class="msg-cnt"></div>
						</div>
					</div>
				</form>
			</div>

			<script type="text/javascript">
				window.CONFIG = {
					_tb_token_ : "eb83b0103e537",
					api : "//member1.taobao.com/member/fresh/deliver_address_editor_save_submit.do?_input_charset=gb2312",
					map : {
						mapType : 'trade',
						mapSize : {
							width : 300,
							height : 300
						}
					},
					isInGrayTest : false
				};

				window.CONSTANT = {
					"ERROR_FORBIDDEN_WORD" : "您的输入包含非法字符，请重新输入",
					"ERROR_HAS_NO_DIVISION_CODE_ERR" : "该收货地址信息不完整，请删除后重新输入",
					"ERROR_ENCODING_INPUT" : "您的输入字符编码错误，请重新输入",
					"ERROR_ILLEGAL_PARAM" : "错误的参数",
					"ERROR_MAX_DELIVER_ADDR_NUMBER" : "您的收货地址数已经达到最大允许的数量",
					"ERROR_ILLEGAL_PARAM_ADDRESS" : "<font color='red'>详细地址</font>最少5个字，最多不能超过120个字",
					"ERROR_DELIVER_ADDRESS_REQUIRE_MOBILE_OR_PHONE" : "手机号码和电话号码至少需要一个",
					"ERROR_ILLEGAL_FULLNAME" : "<font color='red'>收货人姓名</font>不能少于2个字，不能超过25个字",
					"ERROR_ILLEGAL_PARAM_MOBILEPHONE" : "<font color='red'>手机号码</font>格式不正确",
					"ERROR_ILLEGAL_POSTCODE" : "收货地址需要6位的<font color='red'>邮政编码</font>",
					"ERROR_ILLEGAL_PHONESECTION" : "<font color='red'>电话区号</font>必须由3到6个数字组成",
					"ERROR_ILLEGAL_PHONECODE" : "<font color='red'>电话号码</font>必须由5到10个数字组成",
					"ERROR_ILLEGAL_PHONEEXT" : "<font color='red'>电话分机</font>必须少于6个数字"
				};
			</script>
			<script type="text/javascript">
				TRLang = {
					"d_p_detailAddress_msg" : "5-120个字符，一个汉字为两个字符",
					"d_p_postCode_msg" : "请输入邮编",
					"d_p_fullName_msg" : "收货人姓名应为2-25个字符，一个汉字为两个字符",
					"d_p_mobile_msg" : "6-20个数字",
					"d_p_wrongFormat" : "区号或电话号码格式不正确",
					"d_p_pleaseChooseCountry" : "请选择国家或地区",
					"d_p_pleaseChooseCity" : "请选择城市",
					"d_p_pleaseChoosedetail" : "请选择详细的行政区划",
					"d_p_pleaseChooseProv_city_street" : "请选择省市区",
					"d_p_completeTown" : "请补充乡镇街道地址",
					"d_p_chooseProv" : "省份",
					"d_p_chooseCity" : "城市",
					"d_p_chooseTown" : "县区",
					"d_p_chooseStreet" : "街道",
					"d_p_fillDetailFirst" : "先填详细地址，稍后再获取街道地址",
					"d_p_fillLater" : "稍后再说",
					"d_p_virtralAddress" : "如您无法找到原地址所属的区域，可能该区已被合并或属于虚拟&#10;行政区（地方经济开发区，非国家三级行政区），请根&#10;据提示选择正确的区县",
					"d_p_others" : "其他",
					"d_p_state" : "州",
					"d_p_city" : "市",
					"d_p_pleaseChoose" : "请选择",

					"d_p_location_haiwai" : "国家 <i>*</i>",
					"d_p_address_haiwai" : "详细地址 <i>*</i>",
					"d_p_city_haiwai" : "城市 <i>*</i>",
					"d_p_regin_haiwai" : "地区 <i>*</i>",
					"d_p_postCode_haiwai" : "邮政编码",
					"d_p_receiverName_haiwai" : "姓名 <i>*</i>",
					"d_p_phone_haiwai" : "手机 <i>*</i>",
					"d_p_input_inner_postCode_haiwai" : "请正确填写邮编 (Zip Code)",
					"d_p_input_inner_fullName_haiwai" : "长度不超过25个字符",
					"d_p_input_inner_mobile_haiwai" : "手机号码必须填一项6-20个数字",
					"d_p_add_haiwai" : "新增国际地址",
					"d_p_default_haiwai" : "设置默认地址",
					"d_p_save_haiwai" : "保存"
				};
			</script>


			<script
				src="//webapi.amap.com/maps?v=1.3&key=4e84b3fa70fbdc218a1f944fafc129e7"
				language="javascript"></script>
			<script src="//g.alicdn.com//vip/address/6.1.1/index-min.js"
				charset="gb2312"></script>
			<script
				src="//g.alicdn.com//vip/mbis/0.4.27/address/js/??taobao.js,address.js,index.js?t=20150910"></script>



		</div>
	</div>
	<ul class="examples">

		<li class="message">
			<div class="ui">
				<p>基本信息弹窗</p>
				<button>尝试一下</button>
			</div> <pre>
				<span class="attr">swal</span>(<span class="str">"这是一条信息！"</span>)</pre>
		</li>

	</ul>
	<SCRIPT> 
		$('.examples .message button').on('click',function(){
			swal({ 
				 title: '添加地址',
				  html:
				    '<input id="swal-input1" class="swal2-input">' +
				    '<input id="swal-input2" class="swal2-input">',
				  preConfirm: function () {
				    return new Promise(function (resolve) {
				      resolve([
				        $('#swal-input1').val(),
				        $('#swal-input2').val()
				      ])
				    })
				  },
				  onOpen: function () {
				    $('#swal-input1').focus()
				  }
				}).then(function (result) {
				  swal(JSON.stringify(result))
				}).catch(swal.noop)
			})
</SCRIPT>
</body>
</html>
