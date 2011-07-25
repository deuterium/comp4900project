function Print(strContentId) {
    var content = document.getElementById(strContentId);
    var WinPrint = window.open('', '', 'left=0,top=0,width=600,height=600,toolbar=0,scrollbars=0,status=0');
    WinPrint.document.write(content.innerHTML);
    WinPrint.focus();
    WinPrint.print();
}

function PrintWithHeader(strHeaderId, strContentId) {
    var header = document.getElementById(strHeaderId);
    var content = document.getElementById(strContentId);
    var WinPrint = window.open('', '', 'left=0,top=0,width=600,height=600,toolbar=0,scrollbars=0,status=0');
    WinPrint.document.write(header.innerHTML);
    WinPrint.document.write(content.innerHTML);
    WinPrint.focus();
    WinPrint.print();
}
