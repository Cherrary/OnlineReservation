<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<title>�ջ���ַ</title>
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
						data-phase-id="d_p_addNewDeliverAddress" id="J_DeliverTitle">�����ջ���ַ
					</span><span class="tsl" data-phase-id="d_p_addNewDeliverAddressNotice">�绰���롢�ֻ���ѡ��һ��,
						�����Ϊ������</span>
				</div>
				<form action="addAddress" method="get">

					<div class="item item-devision" id="J_ItemDivision">
						<span class="item-label tsl" data-phase-id="d_p_location">���ڵ���
							<i>*</i>
						</span>

						<div id="J_CitySelect" class="ks-clear clearfix">
							<input type="hidden" name="country" class="J_iCountry" value="1" />
							<input type="hidden" name="prov" class="J_iProv" value="110000" />
							<input type="hidden" name="provExt" class="J_iProvExt" value="" />
							<input type="hidden" name="city" class="J_iCity" value="110100" />
							<input type="hidden" name="area" class="J_iArea" value="110108" />
							<input type="hidden" name="town" class="J_iTown"
								value="110108010" /> <select class="J_Country" aria-label="��ѡ��">
								<option class="tsl" data-phase-id="d_p_chooseStation" value="">��ѡ��</option>
								<option class="tsl" data-phase-id="d_p_chinaInland" value="0"
									selected>�й���½</option>
								<option class="tsl" data-phase-id="d_p_taiWan" value="710000">̨��</option>
								<option class="tsl" data-phase-id="d_p_gangAoTai" value="1">�۰�</option>
								<option class="tsl" data-phase-id="d_p_malaysia" value="125">��������</option>
								<option class="tsl" value="16">�Ĵ�����</option>
								<option class="tsl" data-phase-id="d_p_foreignCountry"
									value="990000">��������</option>
							</select>
							<div
								class="bf-select bf-cn-select lSelect select-node J_Modify J_CnCity">
								<div id="city-title" class="city-title has-city-title">
									����/������/������/ѧԺ·�ֵ�</div>
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
						<span class="item-label tsl" data-phase-id="d_p_addressDetail">��ϸ��ַ
							<i>*</i>
						</span>
						<div class="ks-combobox" id="J_ComboboxStreet"
							aria-pressed="false">
							<div class="ks-combobox-input-wrap">
								<input name="where" class="ks-combobox-input i-ta disabled tsl"
									aria-combobox="list" role="combobox" autocomplete="off"
									name="addressDetail" id="J_Street" aria-label="��ϸ��ַ"
									placeholder="��������ʵ��д��ϸ�ջ���ַ"
									data-inner_placeholder="d_p_input_inner_detailAddress"
									data-pattern="^[\s\S]{5,120}$" data-msg="d_p_detailAddress_msg"
									data-ph="��������ʵ��д��ϸ�ջ���ַ������ֵ����ƣ����ƺ��룬¥��ͷ���ŵ���Ϣ"
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
						<span class="item-label tsl" data-phase-id="d_p_postCode">��������
						</span>
						<div class="item-warp">
							<input name="post" aria-label="��������" maxlength=16
								data-item="postcode" placeholder="����������ʵ����ţ�����д000000"
								data-inner_placeholder="d_p_input_inner_postCode"
								data-ph="����������ʵ����ţ�����д000000" data-pattern="^.{0,16}$"
								data-msg="d_p_postCode_msg" class="i-text tsl" id="J_PostCode"
								type="text" value="100091">
						</div>

						<div class="msg hide" id="J_MsgPostCode">
							<i></i>

							<div class="msg-cnt tsl" data-phase-id="d_p_postNotExit">�ʱ಻����</div>
						</div>
					</div>
					<div class="item item-name" id="J_ItemName">
						<span class="item-label tsl" data-phase-id="d_p_receiverName">�ջ�������
							<i>*</i>
						</span>
						<div class="item-warp">
							<input name="fullName" class="i-text tsl" aria-label="�ջ�������"
								type="text" id="J_Name" placeholder="���Ȳ�����25���ַ�"
								data-inner_placeholder="d_p_input_inner_fullName"
								data-pattern="^.{2,25}$" data-msg="d_p_fullName_msg"
								data-ph="���Ȳ�����25���ַ�" value="�¼�">
						</div>

						<div class="msg hide" id="J_MsgName">
							<i></i>

							<div class="msg-cnt"></div>
						</div>
					</div>
					<div class="item item-mobile" id="J_ItemMobile">
						<span class="item-label tsl" data-phase-id="d_p_mobileNumber">�ֻ�����
						</span> <select name="mobile_area" id="J_MobileArea" aria-label="�ֻ�����">
							<option value="1" data-code='86'>�й���½ +86</option>
							<option value="2" data-code='852'>��� +852</option>
							<option value="3" data-code='853'>���� +853</option>
							<option value="4" data-code='886'>̨�� +886</option>
							<option value="10" data-code='65'>�¼��� +65</option>
							<option value="11" data-code='60'>�������� +60</option>
							<option value="36" data-code='61'>�Ĵ����� +61</option>
							<option value="18" data-code='64'>������ +64</option>
							<option value="7" data-code='1'>���� +1</option>
							<option value="8" data-code='1'>���ô� +1</option>
							<option value="6" data-code='81'>�ձ� +81</option>
							<option value="5" data-code='82'>���� +82</option>
							<option value="9" data-code='44'>Ӣ�� +44</option>
							<option value="12" data-code='66'>̩�� +66</option>
							<option value="13" data-code='84'>Խ�� +84</option>
							<option value="14" data-code='63'>���ɱ� +63</option>
							<option value="15" data-code='62'>ӡ�������� +62</option>
							<option value="16" data-code='39'>����� +39</option>
							<option value="17" data-code='7'>����˹ +7</option>
							<option value="19" data-code='31'>���� +31</option>
							<option value="20" data-code='46'>��� +46</option>
							<option value="21" data-code='380'>�ڿ��� +380</option>
							<option value="91" data-code='33'>���� +33</option>
							<option value="96" data-code='49'>�¹� +49</option>
							<option value="22" data-code='93'>������ +93</option>
							<option value="25" data-code='355'>���������� +355</option>
							<option value="26" data-code='213'>���������� +213</option>
							<option value="27" data-code='1684'>����Ħ��(��) +1684</option>
							<option value="28" data-code='376'>������ +376</option>
							<option value="29" data-code='244'>������ +244</option>
							<option value="30" data-code='1264'>��������(Ӣ) +1264</option>
							<option value="32" data-code='1268'>����ϺͰͲ��� +1268</option>
							<option value="33" data-code='54'>����͢ +54</option>
							<option value="34" data-code='374'>�������� +374</option>
							<option value="35" data-code='297'>��³�͵� +297</option>
							<option value="37" data-code='43'>�µ��� +43</option>
							<option value="38" data-code='994'>�����ݽ� +994</option>
							<option value="39" data-code='973'>���� +973</option>
							<option value="41" data-code='880'>�ϼ����� +880</option>
							<option value="42" data-code='1246'>�ͰͶ�˹ +1246</option>
							<option value="43" data-code='375'>�׶���˹ +375</option>
							<option value="44" data-code='32'>����ʱ +32</option>
							<option value="45" data-code='501'>������ +501</option>
							<option value="46" data-code='229'>���� +229</option>
							<option value="47" data-code='1441'>��Ľ��Ⱥ��(Ӣ) +1441</option>
							<option value="48" data-code='975'>���� +975</option>
							<option value="49" data-code='591'>����ά�� +591</option>
							<option value="50" data-code='387'>��˹���Ǻͺ�����ά�� +387</option>
							<option value="51" data-code='267'>�������� +267</option>
							<option value="52" data-code='55'>���� +55</option>
							<option value="53" data-code='359'>�������� +359</option>
							<option value="54" data-code='226'>�����ɷ��� +226</option>
							<option value="55" data-code='257'>��¡�� +257</option>
							<option value="56" data-code='237'>����¡ +237</option>
							<option value="58" data-code='238'>��ý� +238</option>
							<option value="59" data-code='1345'>����Ⱥ��(Ӣ) +1345</option>
							<option value="60" data-code='236'>�з� +236</option>
							<option value="61" data-code='235'>է�� +235</option>
							<option value="62" data-code='56'>���� +56</option>
							<option value="63" data-code='61'>ʥ���� +61</option>
							<option value="64" data-code='61'>�ƿ�˹�� +61</option>
							<option value="65" data-code='57'>���ױ��� +57</option>
							<option value="66" data-code='269'>��Ħ�� +269</option>
							<option value="67" data-code='242'>�չ� +242</option>
							<option value="68" data-code='682'>�ƿ�Ⱥ��(��) +682</option>
							<option value="69" data-code='506'>��˹����� +506</option>
							<option value="70" data-code='385'>���޵��� +385</option>
							<option value="71" data-code='53'>�Ű� +53</option>
							<option value="72" data-code='357'>����·˹ +357</option>
							<option value="73" data-code='420'>�ݿ� +420</option>
							<option value="75" data-code='45'>���� +45</option>
							<option value="77" data-code='253'>������ +253</option>
							<option value="78" data-code='1767'>������˹� +1767</option>
							<option value="79" data-code='1809'>������ӹ��͹� +1809</option>
							<option value="80" data-code='593'>��϶�� +593</option>
							<option value="81" data-code='20'>���� +20</option>
							<option value="82" data-code='503'>�����߶� +503</option>
							<option value="83" data-code='240'>��������� +240</option>
							<option value="84" data-code='291'>���������� +291</option>
							<option value="85" data-code='372'>��ɳ���� +372</option>
							<option value="86" data-code='251'>��������� +251</option>
							<option value="87" data-code='500'>������Ⱥ�� +500</option>
							<option value="88" data-code='298'>����Ⱥ��(��) +298</option>
							<option value="89" data-code='679'>쳼� +679</option>
							<option value="90" data-code='358'>���� +358</option>
							<option value="92" data-code='689'>�������������� +689</option>
							<option value="93" data-code='241'>���� +241</option>
							<option value="94" data-code='220'>�Ա��� +220</option>
							<option value="95" data-code='995'>��³���� +995</option>
							<option value="97" data-code='233'>���� +233</option>
							<option value="98" data-code='350'>ֱ������(Ӣ) +350</option>
							<option value="99" data-code='30'>ϣ�� +30</option>
							<option value="100" data-code='299'>�������� +299</option>
							<option value="101" data-code='1473'>�����ɴ� +1473</option>
							<option value="102" data-code='590'>�ϵ����յ�(��) +590</option>
							<option value="103" data-code='1671'>�ص�(��) +1671</option>
							<option value="104" data-code='502'>Σ������ +502</option>
							<option value="105" data-code='224'>������ +224</option>
							<option value="106" data-code='245'>�����Ǳ��� +245</option>
							<option value="108" data-code='592'>������ +592</option>
							<option value="109" data-code='509'>���� +509</option>
							<option value="110" data-code='504'>�鶼��˹ +504</option>
							<option value="111" data-code='36'>������ +36</option>
							<option value="112" data-code='354'>���� +354</option>
							<option value="113" data-code='91'>ӡ�� +91</option>
							<option value="114" data-code='98'>���� +98</option>
							<option value="115" data-code='964'>������ +964</option>
							<option value="116" data-code='353'>������ +353</option>
							<option value="118" data-code='972'>��ɫ�� +972</option>
							<option value="119" data-code='225'>���ص��� +225</option>
							<option value="120" data-code='1876'>����� +1876</option>
							<option value="122" data-code='962'>Լ�� +962</option>
							<option value="123" data-code='855'>������ +855</option>
							<option value="124" data-code='7'>������˹̹ +7</option>
							<option value="125" data-code='254'>������ +254</option>
							<option value="126" data-code='686'>�����˹ +686</option>
							<option value="127" data-code='965'>������ +965</option>
							<option value="128" data-code='996'>������˹˹̹ +996</option>
							<option value="129" data-code='856'>���� +856</option>
							<option value="130" data-code='371'>����ά�� +371</option>
							<option value="131" data-code='961'>����� +961</option>
							<option value="132" data-code='266'>������ +266</option>
							<option value="133" data-code='231'>�������� +231</option>
							<option value="134" data-code='218'>������ +218</option>
							<option value="135" data-code='423'>��֧��ʿ�� +423</option>
							<option value="136" data-code='370'>������ +370</option>
							<option value="137" data-code='352'>¬ɭ�� +352</option>
							<option value="138" data-code='389'>����� +389</option>
							<option value="139" data-code='261'>����˹�� +261</option>
							<option value="140" data-code='265'>����ά +265</option>
							<option value="141" data-code='960'>������� +960</option>
							<option value="142" data-code='223'>���� +223</option>
							<option value="143" data-code='356'>����� +356</option>
							<option value="144" data-code='692'>���ܶ�Ⱥ�� +692</option>
							<option value="145" data-code='596'>�������(��) +596</option>
							<option value="146" data-code='222'>ë�������� +222</option>
							<option value="147" data-code='230'>ë����˹ +230</option>
							<option value="148" data-code='262'>��Լ�ص� +262</option>
							<option value="149" data-code='52'>ī���� +52</option>
							<option value="150" data-code='691'>�ܿ���������(��) +691</option>
							<option value="152" data-code='377'>Ħ�ɸ� +377</option>
							<option value="153" data-code='976'>�ɹ� +976</option>
							<option value="155" data-code='1664'>���������ص�(Ӣ) +1664</option>
							<option value="156" data-code='212'>Ħ��� +212</option>
							<option value="157" data-code='258'>Īɣ�ȿ� +258</option>
							<option value="158" data-code='95'>��� +95</option>
							<option value="159" data-code='264'>���ױ��� +264</option>
							<option value="160" data-code='674'>�³ +674</option>
							<option value="161" data-code='977'>�Ჴ�� +977</option>
							<option value="162" data-code='599'>����������˹Ⱥ�� +599</option>
							<option value="163" data-code='687'>�¿��������Ⱥ��(��) +687</option>
							<option value="164" data-code='505'>������� +505</option>
							<option value="165" data-code='227'>���ն� +227</option>
							<option value="166" data-code='234'>�������� +234</option>
							<option value="167" data-code='683'>Ŧ����(��) +683</option>
							<option value="168" data-code='672'>ŵ���˵�(��) +672</option>
							<option value="169" data-code='850'>���� +850</option>
							<option value="170" data-code='1670'>��������Ⱥ�� +1670</option>
							<option value="171" data-code='47'>Ų�� +47</option>
							<option value="172" data-code='968'>���� +968</option>
							<option value="173" data-code='92'>�ͻ�˹̹ +92</option>
							<option value="174" data-code='680'>����(��) +680</option>
							<option value="175" data-code='507'>������ +507</option>
							<option value="176" data-code='675'>�Ͳ����¼����� +675</option>
							<option value="177" data-code='595'>������ +595</option>
							<option value="178" data-code='51'>��³ +51</option>
							<option value="179" data-code='48'>���� +48</option>
							<option value="180" data-code='351'>������ +351</option>
							<option value="181" data-code='1'>�������(��) +1</option>
							<option value="182" data-code='974'>������ +974</option>
							<option value="183" data-code='373'>Ħ������ +373</option>
							<option value="184" data-code='262'>�������� +262</option>
							<option value="185" data-code='40'>�������� +40</option>
							<option value="186" data-code='250'>¬���� +250</option>
							<option value="187" data-code='247'>��ɭ��(Ӣ) +247</option>
							<option value="188" data-code='290'>ʥ������ +290</option>
							<option value="189" data-code='1869'>ʥ����˹�и�����ά˹ +1869</option>
							<option value="190" data-code='1758'>ʥ¬���� +1758</option>
							<option value="191" data-code='508'>ʥƤ���������ܿ�¡�� +508</option>
							<option value="192" data-code='1784'>ʥ��ɭ�ص�(Ӣ) +1784</option>
							<option value="193" data-code='685'>����Ħ�� +685</option>
							<option value="194" data-code='378'>ʥ����ŵ +378</option>
							<option value="195" data-code='239'>ʥ�������������� +239</option>
							<option value="196" data-code='966'>ɳ�ذ����� +966</option>
							<option value="197" data-code='221'>���ڼӶ� +221</option>
							<option value="199" data-code='248'>����� +248</option>
							<option value="200" data-code='232'>�������� +232</option>
							<option value="202" data-code='421'>˹�工�� +421</option>
							<option value="203" data-code='386'>˹�������� +386</option>
							<option value="204" data-code='677'>������Ⱥ�� +677</option>
							<option value="205" data-code='252'>������ +252</option>
							<option value="206" data-code='27'>�Ϸ� +27</option>
							<option value="208" data-code='34'>������ +34</option>
							<option value="209" data-code='94'>˹������ +94</option>
							<option value="210" data-code='249'>�յ� +249</option>
							<option value="211" data-code='597'>������ +597</option>
							<option value="213" data-code='268'>˹��ʿ�� +268</option>
							<option value="214" data-code='41'>��ʿ +41</option>
							<option value="215" data-code='963'>������ +963</option>
							<option value="216" data-code='992'>������˹̹ +992</option>
							<option value="217" data-code='1242'>�͹���� +1242</option>
							<option value="218" data-code='14397'>��ٸ� +14397</option>
							<option value="220" data-code='228'>��� +228</option>
							<option value="222" data-code='676'>���� +676</option>
							<option value="223" data-code='1868'>�������Ͷ�͸� +1868</option>
							<option value="224" data-code='216'>ͻ��˹ +216</option>
							<option value="225" data-code='90'>������ +90</option>
							<option value="226" data-code='993'>������˹̹ +993</option>
							<option value="227" data-code='1649'>�ؿ�˹�Ϳ���˹Ⱥ��(Ӣ) +1649</option>
							<option value="228" data-code='688'>ͼ��¬ +688</option>
							<option value="229" data-code='256'>�ڸɴ� +256</option>
							<option value="231" data-code='44'>Ӣ�� +44</option>
							<option value="232" data-code='255'>̹ɣ���� +255</option>
							<option value="234" data-code='598'>������ +598</option>
							<option value="235" data-code='998'>���ȱ��˹̹ +998</option>
							<option value="236" data-code='678'>��Ŭ��ͼ +678</option>
							<option value="237" data-code='58'>ί������ +58</option>
							<option value="238" data-code='1340'>ά����Ⱥ��(Ӣ) +1340</option>
							<option value="242" data-code='967'>Ҳ�� +967</option>
							<option value="243" data-code='381'>��˹���� +381</option>
							<option value="244" data-code='260'>�ޱ��� +260</option>
							<option value="245" data-code='259'>ɣ���Ͷ� +259</option>
							<option value="246" data-code='263'>��Ͳ�Τ +263</option>
						</select>
						<div class="item-warp">
							<input name="mobile" class="i-text tsl" aria-label="�ֻ�����"
								type="text" id="J_Mobile" placeholder="�绰���롢�ֻ����������һ��"
								autocomplete="off"
								data-inner_placeholder="d_p_input_inner_mobile"
								data-pattern="^\d{6,20}$" data-ph="�绰���롢�ֻ����������һ��"
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
							data-phase-id="d_p_saveAsDefaultAddress">����ΪĬ���ջ���ַ</label>
					</div>
					<div class="item">
						<button class="new-btn-login" style="text-align: center;">����</button>
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
					"ERROR_FORBIDDEN_WORD" : "������������Ƿ��ַ�������������",
					"ERROR_HAS_NO_DIVISION_CODE_ERR" : "���ջ���ַ��Ϣ����������ɾ������������",
					"ERROR_ENCODING_INPUT" : "���������ַ������������������",
					"ERROR_ILLEGAL_PARAM" : "����Ĳ���",
					"ERROR_MAX_DELIVER_ADDR_NUMBER" : "�����ջ���ַ���Ѿ��ﵽ������������",
					"ERROR_ILLEGAL_PARAM_ADDRESS" : "<font color='red'>��ϸ��ַ</font>����5���֣���಻�ܳ���120����",
					"ERROR_DELIVER_ADDRESS_REQUIRE_MOBILE_OR_PHONE" : "�ֻ�����͵绰����������Ҫһ��",
					"ERROR_ILLEGAL_FULLNAME" : "<font color='red'>�ջ�������</font>��������2���֣����ܳ���25����",
					"ERROR_ILLEGAL_PARAM_MOBILEPHONE" : "<font color='red'>�ֻ�����</font>��ʽ����ȷ",
					"ERROR_ILLEGAL_POSTCODE" : "�ջ���ַ��Ҫ6λ��<font color='red'>��������</font>",
					"ERROR_ILLEGAL_PHONESECTION" : "<font color='red'>�绰����</font>������3��6���������",
					"ERROR_ILLEGAL_PHONECODE" : "<font color='red'>�绰����</font>������5��10���������",
					"ERROR_ILLEGAL_PHONEEXT" : "<font color='red'>�绰�ֻ�</font>��������6������"
				};
			</script>
			<script type="text/javascript">
				TRLang = {
					"d_p_detailAddress_msg" : "5-120���ַ���һ������Ϊ�����ַ�",
					"d_p_postCode_msg" : "�������ʱ�",
					"d_p_fullName_msg" : "�ջ�������ӦΪ2-25���ַ���һ������Ϊ�����ַ�",
					"d_p_mobile_msg" : "6-20������",
					"d_p_wrongFormat" : "���Ż�绰�����ʽ����ȷ",
					"d_p_pleaseChooseCountry" : "��ѡ����һ����",
					"d_p_pleaseChooseCity" : "��ѡ�����",
					"d_p_pleaseChoosedetail" : "��ѡ����ϸ����������",
					"d_p_pleaseChooseProv_city_street" : "��ѡ��ʡ����",
					"d_p_completeTown" : "�벹������ֵ���ַ",
					"d_p_chooseProv" : "ʡ��",
					"d_p_chooseCity" : "����",
					"d_p_chooseTown" : "����",
					"d_p_chooseStreet" : "�ֵ�",
					"d_p_fillDetailFirst" : "������ϸ��ַ���Ժ��ٻ�ȡ�ֵ���ַ",
					"d_p_fillLater" : "�Ժ���˵",
					"d_p_virtralAddress" : "�����޷��ҵ�ԭ��ַ���������򣬿��ܸ����ѱ��ϲ�����������&#10;���������ط����ÿ��������ǹ��������������������&#10;����ʾѡ����ȷ������",
					"d_p_others" : "����",
					"d_p_state" : "��",
					"d_p_city" : "��",
					"d_p_pleaseChoose" : "��ѡ��",

					"d_p_location_haiwai" : "���� <i>*</i>",
					"d_p_address_haiwai" : "��ϸ��ַ <i>*</i>",
					"d_p_city_haiwai" : "���� <i>*</i>",
					"d_p_regin_haiwai" : "���� <i>*</i>",
					"d_p_postCode_haiwai" : "��������",
					"d_p_receiverName_haiwai" : "���� <i>*</i>",
					"d_p_phone_haiwai" : "�ֻ� <i>*</i>",
					"d_p_input_inner_postCode_haiwai" : "����ȷ��д�ʱ� (Zip Code)",
					"d_p_input_inner_fullName_haiwai" : "���Ȳ�����25���ַ�",
					"d_p_input_inner_mobile_haiwai" : "�ֻ����������һ��6-20������",
					"d_p_add_haiwai" : "�������ʵ�ַ",
					"d_p_default_haiwai" : "����Ĭ�ϵ�ַ",
					"d_p_save_haiwai" : "����"
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
				<p>������Ϣ����</p>
				<button>����һ��</button>
			</div> <pre>
				<span class="attr">swal</span>(<span class="str">"����һ����Ϣ��"</span>)</pre>
		</li>

	</ul>
	<SCRIPT> 
		$('.examples .message button').on('click',function(){
			swal({ 
				 title: '��ӵ�ַ',
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
