#!/bin/bash
#
# Re run if changed HTML page.
#

echo "Converting '.html' pages to '.h' ... output to ../common/v001/ "

python main/conv_http.py main/page_1.html ../common/v001/html_page1.h  index_html
python main/conv_http.py main/page_2.html ../common/v001/html_page2.h  scan_html
python main/conv_http.py main/page_3.html ../common/v001/html_page3.h  station_html
python main/conv_http.py main/page_4.html ../common/v001/html_page4.h  advanced_html
python main/conv_http.py main/page_5.html ../common/v001/html_page5.h  time_html
python main/conv_http.py main/page_6.html ../common/v001/html_page6.h  test_html
python main/conv_http.py main/page_7.html ../common/v001/html_page7.h  timer_html

#echo Done.











