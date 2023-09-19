# ATTACKER 2022 

BÁO CÁO

SỬ DỤNG HOC MÁY TRONG DỰ ĐOÁN GIAN LẬN TRONG HOẠT ĐỘNG TÍN DỤNG CỦA NGÂN HÀNG

A project using some machine learning tools for fraud detection in banking credit transactions. This is a project for a competition named Attacker2022.

Đội thi: ATTACKER ATTACKER

MỤC LỤC 

1. [Phân tích khám phá dữ liệu (EDA) .......................................................................................... 3 ](#_page2_x71.00_y83.68)  
1.1. [Mô tả dữ liệu: ................................................................................................................... 3 ](#_page2_x71.00_y126.68)  
1.2. [Thống kê mô tả ................................................................................................................. 3 ](#_page2_x71.00_y239.68)  
1.2.1. [Dữ liệu định lượng: ........................................................................................................ 3 ](#_page2_x71.00_y276.68)  
1.2.2. [Dữ liệu định tính: ........................................................................................................... 3 ](#_page2_x71.00_y511.68)  
1.2.3. [Các biến chưa xác định và khác ....................................................................................... 4 ](#_page3_x71.00_y336.68)  
1.3. [Dữ liệu thiếu ..................................................................................................................... 5 ](#_page4_x111.00_y289.68)  
1.4. [Phân phối của dữ liệu: ........................................................................................................ 5 ](#_page4_x71.00_y382.68)  
1.4.1. [Dữ liệu định tính: ........................................................................................................... 5 ](#_page4_x71.00_y418.68)  
1.4.2. [Dữ liệu định lượng ......................................................................................................... 5 ](#_page4_x71.00_y578.68)  
3. [Làm sạch dữ liệu................................................................................................................... 6 ](#_page5_x71.00_y185.68)  
2.1. [Lỗi định dạng.................................................................................................................... 6 ](#_page5_x71.00_y228.68)  
2.2. [Loại bỏ các biến không dùng đến ........................................................................................ 6 ](#_page5_x71.00_y366.68)  
2.3. [Xử lý dữ liệu bị thiếu ......................................................................................................... 6 ](#_page5_x71.00_y453.68)  
2.4. [Kiểm tra mức độ tương quan giữa các biến ........................................................................... 7 ](#_page6_x71.00_y298.68)  
4. [Xây dựng mô hình ............................................................................................................. 7 ](#_page6_x71.00_y568.68)  
3.1. [Mô hình hồi quy Logistic ................................................................................................... 7 ](#_page6_x71.00_y611.68)  
3.2. [Mô hình Deep Learning (Mạng nơ-ron)................................................................................ 8 ](#_page7_x71.00_y385.68)  
3.3. [Mô hình Random Forest ..................................................................................................... 9 ](#_page8_x71.00_y158.68)  
3.4. [Mô hình SVM ................................................................................................................... 9 ](#_page8_x71.00_y710.68)  
5. [So sánh và chọn mô hình .................................................................................................. 10 ](#_page9_x71.00_y451.68)  
6. [Tiến hành dự đoán .............................................................................................................. 10 ](#_page9_x71.00_y564.68)


1. Phân<a name="_page2_x71.00_y83.68"></a> tích khám phá dữ liệu (EDA)  
1.1. Mô<a name="_page2_x71.00_y126.68"></a> tả dữ liệu: 

Bộ dữ liệu “train\_attacker\_2022” bao gồm 48030 quan sát (dòng) và 66 biến (cột). Đây là thông tin chi tiết của các giao dịch của khách hàng được ghi chép bởi ngân hàng. Bảng ở dưới là mô tả chung của dữ liệu: 

**Bảng 1. Mô tả chung [\[1\]](#_page11_x351.00_y89.68)** 

Vào những phần sau của khám phá dữ liệu, chúng tôi sẽ đưa ra các giả thuyết về những dữ liệu đã bị ẩn. 

1.2. Thống<a name="_page2_x71.00_y239.68"></a> kê mô tả 
1.2.1. Dữ<a name="_page2_x71.00_y276.68"></a> liệu định lượng: 

Xử lý một số biến bị định dạng sai trong bộ dữ liệu (các biến cat, dob). 

Đồng thời do các biến unknown chưa được xác định, phần thống kê mô tả dữ liệu định lượng sẽ không bao gồm những biến trên. 

Biến value có tên biến bị định dạng lỗi “ value “, chúng tôi thay đổi thành tên đúng “value”; value có dạng object, chúng tôi đổi thành dạng số (float). Biến review\_value có tên biến bị định dạng lỗi “ review\_value“, chúng tôi thay đổi thành tên đúng “review\_value”; review\_value có dạng object, đổi thành dạng số (float) Sử dụng phần mềm Python và nhận được kết quả thống kê như sau: 

**Bảng 2. Thống kê dữ liệu định lượng [\[2\]](#_page12_x388.00_y172.68)** 

Nhìn chung, chúng tôi thấy có sự tương đồng giữa số lượng quan sát các biến không bị trống (khoảng 22991/ 48030 quan sát giữa các biến với dữ liệu từ ngân hàng, 21644/48030 quan sát từ dữ liệu tài khoản xã hội của khách hàng). Về giá trị của từng biến, hệ số nhân (mul\_rate) có khoảng cách khá lớn giữa giá trị bình quân và giá trị lớn nhất. Với các vị trí 25%, trung vị, 75% đều là 0, ta có thể suy ra rằng hệ số này phân phối phần lớn về 0. Chúng tôi sẽ kiểm tra kỹ hơn trong phần đồ thị phân phối.  

Các biến còn lại: giá trị giao dịch, số ngày kiểm duyệt, giá trị kiểm duyệt, số lượng giao dịch, lượng bạn bè, lượng người đăng ký đều có tính chất tương tự với hệ số nhân. 

1.2.2. Dữ<a name="_page2_x71.00_y511.68"></a> liệu định tính: 

Như phần trên, các biến định tính đã được chuyển thành loại dữ liệu đúng Chúng tôi có được bảng tổng kết các biến định tính như sau: 

**Bảng 3. Thống kê dữ liệu định tính [\[3\]](#_page12_x384.00_y554.68)** 

Nhận xét về số lượng các biến: 

ID giao dịch và đánh giá giao dịch có đầy đủ dữ liệu. Các biến phân loại (cat\_1,..) trừ cat\_4, cat\_8, cat\_12 đều chỉ có 22991/48030 (~48%). Tương tự vậy, biến giới tính, ID địa chỉ khách hàng đăng ký, ID của người bán cũng có khoảng 48% dữ liệu. Biến vị trí hiện tại (thành phố, quốc gia) có 25% dữ liệu; biến quê quán (thành phố, quốc gia) có khoảng 23% số quan sát. 

Điều này có thể cho thấy rằng có một xu hướng chung trong dữ liệu thiếu. Chúng tôi sẽ kiểm tra kĩ hơn vấn đề này ở phần sau. 

Nhận xét chung về thống kê mô tả từng biến định tính: 

id: ID giao dịch có 36027 giá trị đơn nhất, nghĩa khoảng 25% giao dịch bị lặp lại. Với giao dịch xuất hiện thường xuyên nhất là 39888 với tần suất là 6 lần.  

label: Số lượng giao dịch trong tập dữ liệu có 65% là giao dịch chính thống (không lừa đảo) 

cat\_1, cat\_2: Dữ liệu phân loại 1, 2 đều có 2 loại với loại xuất hiện thường xuyên nhất lần lượt là C1 và P2 chiếm ~ 54%, không có quá nhiều chênh lệch về số lượng giữa 2 loại trong từng biến cat\_1, cat\_2. cat\_3, cat\_4, cat\_5, cat\_6: Dữ liệu đều có đa dạng giá trị đơn nhất, nhưng đặc điểm chung giữa các biến này là, giá trị thông dụng nhất chiếm phần lớn trong dữ liệu sẵn có hầu hết lớn hơn 90% đặc biệt là biến cat\_5: những quan sát có dữ liệu đều là thuộc 1 nhóm. Về cat\_4, mặc dù có 12 giá trị đơn nhất, chỉ có UI là xuất hiện thường xuyên với tần suất cao. 

Tương tự các biến cat\_7 đến cat\_12, mặc dù có nhiều nhóm nhưng tần suất giao dịch hầu hết tập trung chỉ vào một số nhóm cụ thể. Ta sẽ kiểm tra kỹ hơn ở phần phân phối trong đồ thị. 

sex: Về giới tính của khách hàng, tần suất khá cân bằng giữa nam và nữ (57%, 43%) 

location\_id: ID địa chỉ khách hàng đăng ký có 34 nhóm với nhóm DN là phổ biến nhất chiếm hơn 59% mer\_id: ID của người bán khá đa dạng với 10160 nhóm trong 22991 lượng dữ liệu sẵn có, ID người bán có nhiều giao dịch nhất trong dữ liệu là BO0001Z, xuất hiện trong 715 quan sát. 

trans\_currency: Loại tiền tệ của giao dịch phần lớn là VN (đồng) chiếm hơn 93% số dữ liệu sẵn có. com\_type: Về phân loại khách hàng doanh nghiệp, ta có 9 nhóm, nhưng nhóm Vùng 1 chiếm hơn 50% số quan sát. 

social\_sex\_info, social\_location\_id: Về thông tin trên mạng xã hội của khách hàng, 59% tài khoản có dữ liệu là nam giới, có thể do số lượng thông tin thu thập được chưa được đẩy đủ nên có sự khác biệt giữa thông tin trên mạng xã hội và thông tin từ ngân hàng. ID địa chỉ trên tài khoản xã hội của khách hàng trên 96% là ở Việt Nam. 

current\_location\_city, current\_location\_country: Địa chỉ hiện tại của khách hàng về thành phố: phần lớn từ Hồ Chí Minh khoảng 20%, về quốc gia: là Việt Nam trên 97%. 

hometown\_location\_city, hometown\_location\_country: Thông tin quê quán khách hàng: thành phố khác với địa chỉ hiện tại 11% là ở Hà Nội, còn quốc gia vẫn là Việt Nam (98%) 

1.2.3. Các<a name="_page3_x71.00_y336.68"></a> biến chưa xác định và khác 

Sau quan sát dữ liệu, chúng tôi đưa ra:  

**Bảng 4. Giả định loại dữ liệu của các biến chưa xác định [\[4\]](#_page13_x434.00_y575.68)** 

Các  biến  unknown\_var\_5,  unknown\_var\_6,  unknown\_var\_11,  unknown\_var\_16,  unknown\_var\_18, unknown\_var\_19, unknown\_var\_20 được xác định là biến định tính trong thang đo Likirt. 

Các biến còn lại sẽ là biến định lượng. 

**Bảng 5. Thống kê biến unknown định tính  [\[5\]](#_page14_x403.00_y137.68)** 

Về số lượng quan sát sẵn có, unknown\_var\_18, 19, 20 có lượng giống nhau, thể hiện mối quan hệ trong nguồn dữ liệu. Tương tự với các biến định tính chúng tôi đã khám phá ở trên, phần lớn dữ liệu tập trung vào một vài nhóm nhất định. Đặc biệt ở unknown\_var\_6 và unknown\_var\_16 trên 90% dữ liệu. 

**Bảng 6. Thống kê biến unknown định lượng [\[6\]](#_page14_x405.00_y351.68)** 

Có thể thấy, lượng dữ liệu của biến unknown\_var\_13, 14, 15 giống nhau (22991). unknown\_var\_1, 2,3,4 đều có giá trị nhỏ nhất là 1 với giá trị lớn nhất khá gần nhau. Từ các bách phân vị, giá trị trung bình, chúng tôi nhận thấy hầu hết các giá trị nằm về phía bên tay trái (nhỏ hơn), trong khi giá trị lớn nhất khá khác biệt (có  thể  là  dữ  liệu  ngoại  lai).  Về  các  biến  unknown\_var\_7,  unknown\_var\_9,  unknown\_var\_10, unknown\_var\_17, giá trị chạy từ âm đến dương, hầu hết các giá trị nằm về phía âm (nhỏ hơn). Các biến unknown\_var\_12, 13 chạy từ 0 đến 1 với các giá trị trung bình là 0.31, 0.42. 

Biến unknown\_var\_14 có giá trị từ -1 đến 1. Biến unknown\_var\_15 nhận giá trị từ -1 đến 2 với bách phân vị thứ 75 là 0 nghĩa là 75% quan sát có sẵn nhận giá trị nhỏ hơn hoặc bằng 0. 

Các dữ liệu khác 

- Dữ liệu thời gian 

**Bảng 7. Thống kê dữ liệu thời gian [\[7\]](#_page14_x383.00_y689.68)** 

Chúng tôi nhận thấy biến thời gian giao dịch có số lượng bằng nhiều biến đã khám phá ở trên 22991. Thời gian xuất hiện thường xuyên nhất ở cả time\_1 và time\_2 là giống nhau, tương tự với ngày tháng của Field\_11 và date\_4 

- Dữ liệu văn bản 

**Bảng 8. Thống kê dữ liệu văn bản [\[8\]](#_page15_x381.00_y231.68)** 

Lượng thông tin của người bán hàng có rất ít 7570/48030, không chỉ vậy dữ liệu xuất hiện thường xuyên nhất trong biến này là dấu “.”, chưa rõ ràng là dấu này phản ánh điều gì trong biến. 

Địa chỉ khách hàng, tên người bán, công việc khách hàng đều có số lượng là 22991. Về địa chỉ khách hàng và tên người bán, có khá nhiều giá trị đơn nhất. Từ thông tin biến công việc khách hàng, ta nhận thấy “Doanh nghiệp có vốn đầu tư nước ngoài” là phổ biến nhất chiếm 24% quan sát sẵn có của biến. Cụ thể về chi tiết công việc khách hàng, công nhân là khách hàng thực hiện nhiều giao dịch được ghi lại trong dữ liệu nhất với 8.87% giao dịch. 

Vị trí giao dịch cũng có khá nhiều giá trị đơn nhất, với vị trí khách hàng thường xuyên thực hiện giao dịch nhất là “153 Xô Viết Nghệ Tĩnh Quận Bình Thạnh” với 337 giao dịch 

1.3. Dữ<a name="_page4_x111.00_y289.68"></a> liệu thiếu 

**Bảng 9. Thông tin dữ liệu thiếu [\[9\]](#_page15_x375.00_y529.68)** 

Từ bảng, chúng tôi quan sát được là nhiều dữ liệu thiếu cùng số lượng, có nhiều biến thiếu nhiều hơn 40% dữ liệu. Vấn đề này sẽ cần được xử lý. 

1.4. Phân<a name="_page4_x71.00_y418.68"></a><a name="_page4_x71.00_y382.68"></a> phối của dữ liệu: 
1.4.1. Dữ liệu định tính: 

Chúng tôi vẽ phân phối của các biến định tính, trong mục này sẽ thể hiện những đồ thị quan trọng, bất thường, và nhận xét. 

**Hình 1. Đồ thị loại giao dịch [\[I\]](#_page17_x369.00_y258.68)** 

Số lượng giao dịch chính thống gần gấp đôi lượng giao dịch lừa đảo. Về biến cat\_5 

**Hình 2. Đồ thị biến cat\_5 [\[II\]](#_page17_x359.00_y488.68)** Tất cả dữ liệu sẵn có của cat\_5 đều chỉ thuộc vào một nhóm. 

1.4.2. Dữ<a name="_page4_x71.00_y578.68"></a> liệu định lượng 

**Hình 3. Đồ thị biến hệ số nhân [\[III\]](#_page17_x370.00_y702.68)** 

Phân phối của biến hệ số nhân có xu hướng lệch phải. Chúng tôi có thể biến đổi dữ liệu thành dạng Log để nhận được phân phối chuẩn. 

Tương tự vậy, các biến giá trị giao dịch, số ngày kiểm định giao dịch, giá trị giao dịch kiểm định, lượng bạn bè, người đăng ký trên tài khoản mạng xã hội của khách hàng cũng lệch phải. 

**Hình 4. Đồ thị biến số lượng giao dịch của các khách hàng trong tháng trước [\[IV\]](#_page18_x478.00_y296.68)** 

Trong khi đó, phân phối của số lượng giao dịch của các khách hàng trong tháng trước có sự không quy luật. 

Về các biến chưa xác định, phần lớn cũng có phân phối lệch phải. Với ngoại lệ như 

**Hình 5. Đồ thị biến unknown\_var\_7 và  unknown\_var\_9 [\[V\]](#_page18_x433.00_y479.68)** 

Biến unknown\_var\_7, 9 gần với phân phối chuẩn 

**Hình 6. Đồ thị biến unknown\_var\_10, unknown\_var\_13, unknown\_var\_14, unknown\_var\_15 [\[VI\]](#_page19_x517.00_y237.68) Hình 7. Đồ thị biến unknown\_var\_17 [\[VII\]](#_page19_x384.00_y420.68)** 

Unknown\_var\_10, 13, 14, 15, 17 có giao động trong phân phối. 

2. Làm<a name="_page5_x71.00_y185.68"></a> sạch dữ liệu 
2.1. Lỗi<a name="_page5_x71.00_y228.68"></a> định dạng 

Chúng tôi tiến hành xử lý vấn đề đầu tiên của bộ dữ liệu là về lỗi định dạng các biến. Cụ thể, dữ liệu gốc chứa các biến sau ở định dạng lỗi: 

- time\_1, time\_2,... đang ở định dạng datetime có timezone 
- trans\_location, job, com\_type, job\_detail, current\_location\_city, hometown\_location\_city lỗi định dạng mã hóa 

Cách xử lý lỗi đã trình bày ở trên gồm 2 hướng giải quyết: 

- Đưa định dạng time\_1, time\_2 về datetime 
- Mã  hóa  UTF8  cho  trans\_location,  job,  com\_type,  job\_detail,  current\_location\_city, hometown\_location\_city 
2.2. Loại<a name="_page5_x71.00_y366.68"></a> bỏ các biến không dùng đến 

Trong bài báo cáo này, chúng tôi sẽ loại bỏ các biến không dùng đến trong quá trình chạy mô hình machine learning. Các biến không cần thiết bao gồm: 

id,  time\_1,  time\_2,  date\_1,  date\_2,  date\_3,  date\_4,  address,  mer\_id,  mer\_name, trans\_location,  job,  com\_type,  job\_detail,  current\_location\_city, <a name="_page5_x71.00_y453.68"></a>current\_location\_country, hometown\_location\_city, hometown\_location\_country, cat\_5 

2.3. Xử lý dữ liệu bị thiếu 

Tiếp theo, chúng tôi tiến hành xử lý vấn đề dữ liệu bị thiếu. Dựa trên quan sát, bộ dữ liệu cho thấy có nhiều biến có đặc điểm thiếu cùng nhau (missing-together variables). Cụ thể, với các bản ghi bị thiếu giá trị ở biến time\_1, thì các biến khác như time\_2, Field\_11, date\_3, date\_4, v.v cũng bị thiếu theo. Điều này có thể được thể hiện qua bảng tính số lượng các giá trị bị thiếu của các biến có đủ giá trị time\_1 và các biến bị thiếu giá trị time\_1 dưới đây: 

**Bảng 10. Số lượng các giá trị bị thiếu của các biến có đủ giá trị time\_1 [\[10\]](#_page22_x463.00_y71.68) Bảng 11. Số lượng các giá trị bị thiếu của các biến bị thiếu giá trị time\_1 [\[11\]](#_page25_x468.00_y71.68)** 

Từ bảng trên có thể chỉ ra được, trong số 25039 các quan sát bị thiếu giá trị time\_1, thì số lượng các giá trị bị thiếu của biến time\_2, Field\_11, date\_3, date\_4 đều bằng nhau và bằng 25039 giá trị (tức là thiếu 100% số lượng các giá trị). Thêm vào đó, ở các biến khác cũng cho thấy số lượng dữ liệu bị thiếu tương đối nhiều và cũng ở mức 100%. Như vậy, có thể kết luận là các biến time\_1, time\_2, Field\_11, v.v thể hiện đặc điểm thiếu cùng với nhau.  

Bởi vì số lượng các quan sát bị thiếu giá trị time\_1 là rất lớn (25039 quan sát trên tổng số 48030 quan sát, tương ứng 52.13%), cách xử lý thông thường là tiến hành bỏ các quan sát là không khả thi. Để xử lý vấn đề này, chúng tôi tiến hành chia bộ dữ liệu gốc thành 2 phần dữ liệu và sau đó sẽ chạy các mô hình với từng phần dữ liệu: 

- Phần dữ liệu thứ nhất bao gồm các quan sát có đủ giá trị time\_1 
- Phần dữ liệu thứ hai gồm các quan sát thiếu giá trị time\_1 

Giải pháp xử lý dữ liệu bị thiếu đối với hai phần dữ liệu này đều thống nhất như nhau và gồm các bước sau: 

- Với các biến thiếu đáng kể các quan sát (thiếu từ 40% trở lên) thì không có giá trị trong phân tích dữ liệu nên sẽ tiến hành loại bỏ các biến này. 
- Với các biến thiếu từ 40% dữ liệu trở xuống, tiến hành điền lại các giá trị bị thiếu cho các biến đó bằng cách thay thế các giá trị bị thiếu bằng giá trị trung bình (mean), trung vị (median), và yếu vị (mode) của tập dữ liệu đã có. Đối với các biến số cần điền dữ liệu, nếu xuất hiện nhiều giá trị outlier thì sẽ áp dụng cách điền dữ liệu thiếu bằng yếu vị (median), nếu số lượng các outlier tương đối ít thì sẽ áp dụng cách điền dữ liệu bằng trung bình (mean) 

Đồ thị boxplot của phần dữ liệu bao gồm các quan sát có đủ giá trị time\_1 được thể hiện ở hình 8 dưới đây 

**Hình 8. Đồ thị boxplot của phần dữ liệu bao gồm các quan sát có đủ giá trị time\_1 [\[VIII\]](#_page20_x486.00_y471.68)** 

Đồ thị boxplot của phần dữ liệu bao gồm các quan sát thiếu giá trị time\_1 được thể hiện trong hình 9 dưới đây 

**Hình 9. Đồ thị boxplot của phần dữ liệu bao gồm các quan sát thiếu giá trị time\_1 [\[IX\]](#_page21_x486.00_y449.68)** 

2.4. Kiểm<a name="_page6_x71.00_y298.68"></a> tra mức độ tương quan giữa các biến 

Đa cộng tuyến cao (multicollinearity) là một hiện tượng thường gặp trong phân tích dữ liệu. Sự xuất hiện của hiện tượng đa cộng tuyến làm các mô hình bị ước lượng sai và chệch khỏi giá trị chính xác. Chúng tôi xử lý vấn đề này bằng cách kiểm tra hệ số tương quan giữa các biến trong dữ liệu, đối với hai biến có hệ số tương quan từ 0.9 trở lên thì sẽ tiến hành loại bỏ một trong hai biến. 

Đối với phần dữ liệu bao gồm các quan sát có đủ giá trị time\_1, hệ số tương quan của các biến số và các biến phân loại được thể hiện ở hình 10 và hình 11 lần lượt dưới đây: 

**Hình 10. Đồ thị hệ số tương quan của các biến số của dữ liệu có time\_1 [\[X\]](#_page28_x415.00_y515.68)** 

**Hình 11. Đồ thị hệ số tương quan Crammer’s V của các biến phân loại của dữ liệu có time\_1 [\[XI\]](#_page29_x430.00_y506.68)** 

Đối với phần dữ liệu bao gồm các quan sát thiếu giá trị time\_1, hệ số tương quan của các biến số và các biến phân loại được thể hiện ở hình 12 và hình 13 lần lượt dưới đây: 

**Hình 12. Đồ thị hệ số tương quan Crammer’s V của các biến số của dữ liệu thiếu time\_1 [\[XII\]](#_page30_x469.00_y505.68)** 

Đối với phần dữ liệu thiếu giá trị của time\_1 thì chỉ có duy nhất một biến phân loại (biến unknown\_var\_5) <a name="_page6_x71.00_y568.68"></a>nên không có đồ thị tương quan giữa các biến phân loại (chi tiết ở Bảng 11) 

3. Xây<a name="_page6_x71.00_y611.68"></a> dựng mô hình 
3.1. Mô hình hồi quy Logistic 

Vì bộ dữ liệu được định dạng và gắn nhãn (labeled data) nên nhóm nghiên cứu trước tiên sử dụng các mô hình học có giám sát (supervised learning). Trước hết, chúng tôi sử dụng mô hình hồi quy logistics vì tính đơn giản, phù hợp của mô hình và khả năng giải thích cao của nó. 

Mô hình hồi quy logistic là một mô hình thống kê dùng cho các bài toán phân loại và dự báo. Mô hình này ước tính khả năng xảy ra của một biến phân loại dựa trên các biến độc lập. Với bài toán phát hiện gian lận, mục tiêu của chúng tôi là xác định giao dịch có gian lận hay không (biến nhị thức) – trùng khớp với kĩ thuật và mục tiêu của mô hình logistics. Về ý tưởng hình thành mô hình, logistics gần giống với mô hình hồi quy tuyến tính. Điểm khác biệt là mô hình logistics dùng hàm sigmoid để giới hạn giá trị của biến phụ thuộc trong khoảng từ 0 đến 1 – đưa ra dự đoán về khả năng xảy ra của sự kiện. 

Sau khi làm sạch dữ liệu, điền các dữ liệu trống, và loại bỏ các biến tương quan cũng như các biến định danh không có giá trị dự đoán, chúng tôi chia thành 2 mô hình bao gồm: mô hình dữ liệu có đủ số liệu time\_1 (mô hình 1) và mô hình thiếu dữ liệu time\_1 (mô hình 2) 

Kết quả thu được khi chạy mô hình hồi quy tuyến tính là: 

**Bảng 12. Chỉ số của mô hình hồi quy Logistic** 



||Model\_1 |Model\_2 |
| :- | - | - |
|Accuracy |0\.639 |0\.654 |
|Precision |0\.344 |0\.5 |
|Recall |0\.054 |0\.002 |
|F1 |0\.093 |0\.005|

Độ chính xác (Accuracy) của 2 mô hình khá gần nhau xấp xỉ 63.9% và 65.4% lần lượt. Mô hình có khả năng dự đoán chính xác khoảng hai phần ba số lượng quan sát. 

Chỉ số Precision giữa 2 mô hình cũng xấp xỉ nằm ở mức 0.344 và 0.5. Chỉ số Recall và F1 của 2 mô hình tương đối thấp cho thấy hiệu quả dự báo không tốt. 

3.2. Mô<a name="_page7_x71.00_y385.68"></a> hình Deep Learning (Mạng nơ-ron) 

Do để phát hiện lừa đảo trong tài chính, mô hình mạng nơ-ron nhân tạo có hiệu quả cao và vô cùng phổ biến, chúng tôi quyết định áp dụng mô hình này trong bài nghiên cứu.  

Mạng nơ-ron có sự tương đồng chuẩn mạnh với những phương pháp thống kê như đồ thị đường cong và phân tích hồi quy.[1] 

Mạng nơ-ron là một phương thức trong lĩnh vực trí tuệ nhân tạo, được sử dụng để dạy máy tính xử lý dữ liệu theo cách được lấy cảm hứng từ bộ não con người. Đây là một loại quy trình máy học, được gọi là deep learning, sử dụng các nút hoặc nơ-ron liên kết với nhau trong một cấu trúc phân lớp tương tự như bộ não con người. Phương thức này tạo ra một hệ thống thích ứng được máy tính sử dụng để học hỏi từ sai lầm của chúng và liên tục cải thiện.[2] 

Tương tự như trên, chúng tôi chạy mô hình deep learning trên 2 phần dữ liệu: có đủ số liệu time\_1 (mô hình 1) và mô hình thiếu dữ liệu time\_1 (mô hình 2). 

Kết quả thu được khi chạy mô hình deep learning là: 

**Bảng 13. Chỉ số của mô hình Deep learning** 



||Model\_1 |Model\_2 |
| :- | - | - |
|Accuracy |0\.5392|0\.5704 |
|Precision |0\.3369|0\.2688 |
|Recall |0\.3525|0\.3476 |

|F1 |0\.3445|0\.3032 |
| - | - | - |

Nhìn chung các chỉ số của mô hình Deep learning không quá khả quan: dự đoán chính xác chỉ được hơn nửa. Đồng thời, các chỉ số Precision, Recall và F1 cũng không quá cao chỉ tầm hơn 30%. 

3.3. Mô<a name="_page8_x71.00_y158.68"></a> hình Random Forest 

Mô hình decision tree được tạo nên từ những chuỗi câu lệnh if-else (dựa trên các biến độc lập) từ đó tạo nên một lưu đồ giúp chúng tôi dự đoán kết quả dựa trên tập dữ liệu. Ý tưởng của cây quyết định là chia tập dữ liệu thành các tập dữ liệu nhỏ hơn dựa trên những đặc điểm được mô tả. Mỗi câu hỏi giúp một cá nhân đi đến quyết định cuối cùng, quyết định này sẽ được biểu thị bằng nút lá. Các quan sát phù hợp với tiêu chí sẽ đi theo nhánh “Có” và những quan sát không phù hợp sẽ đi theo con đường thay thế.Dựa trên đó, mô hình random forest được tạo thành từ nhiều mô hình decision tree một cách ngẫu nhiên. Random forest được coi là một trong những mô hình học có giám sát được ứng dụng trong bài toán phân loại. So với decision tree, random forest hiệu quả hơn vì nó loại bỏ được tính thiên vị trong mô hình, giảm bớt vấn đề sự quá vừa trong dữ liệu (overfitting data).  

Mô hình rừng cây được huấn luyện dựa trên sự phối hợp giữa luật kết hợp (ensembling) và quá trình lấy mẫu tái lặp (boostrapping). Cụ thể thuật toán này tạo ra nhiều cây quyết định mà mỗi cây quyết định được huấn luyện dựa trên nhiều mẫu con khác nhau và kết quả dự báo là bầu cử (voting) từ toàn bộ những cây quyết định.[3] Như vậy một kết quả dự báo được tổng hợp từ nhiều mô hình nên kết quả của chúng sẽ không bị chệch. Đồng thời kết hợp kết quả dự báo từ nhiều mô hình sẽ có phương sai nhỏ hơn so với chỉ một mô hình.  

Chúng tôi chạy mô hình này trên 2 dữ liệu: có đủ số liệu time\_1 (mô hình 1) và mô hình thiếu dữ liệu time\_1 (mô hình 2): 

Kết quả thu được khi chạy mô hình là: 

**Bảng 14. Chỉ số của mô hình Random Forest** 



||Model\_1 |Model\_2 |
| :- | - | - |
|Accuracy |0\.638 |0\.616 |
|Precision |0\.309 |0\.344 |
|Recall |||


