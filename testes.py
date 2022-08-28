from pathlib import Path
import lxml.etree as ET
import glob
import os

xslt = ET.parse("lmht.xslt")
for nome_arquivo in glob.glob(os.path.join(os.getcwd(), "estruturas/*.lmht")):
    arquivo_lmht = ET.parse(nome_arquivo)
    transform = ET.XSLT(xslt)
    conteudo_html = transform(arquivo_lmht)
    nome_html = Path(nome_arquivo).stem + ".html"
    caminho_html = os.path.join(os.getcwd(), nome_html)
    conteudo_html.write(caminho_html, encoding="utf-8")
