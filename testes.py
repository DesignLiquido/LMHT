import lxml.etree as ET
import glob
import os

xslt = ET.parse("lmht.xslt")
for nome_arquivo in glob.glob(".\estruturas\*.lmht"):
    arquivo_lmht = ET.parse(nome_arquivo)
    transform = ET.XSLT(xslt)
    conteudo_html = transform(arquivo_lmht)
    conteudo_html.write(f"{os.path.splitext(nome_arquivo)[0]}.html", encoding="utf-8")