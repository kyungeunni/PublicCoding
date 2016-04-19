/*
 *	스마트에디터 코드 추가 버튼 기능 구현부 (CodeInsert)
 */
nhn.husky.SE_CodeInsert = jindo.$Class({
    name : "CodeInsert",
    
	$init : function(elAppContainer) {
		this._assignHTMLObjects(elSppContainer);
	},
	
	_assignHTMLObjects : function(elAppContainer){
	    this.oDropdownLayer =
	            cssquery.getSingle("DIV.husky_seditor_CodeInsert_layer", elAppContainer);
	},
	
	$ON_MSG_APP_READY : function() {
	    this.oApp.exec('REGISTER_UI_EVENT', ['CodeInsert', 'click',
	            'SE_TOGGLE_CODEINSERT_LAYER']);
	},
	
	$ON_SE_TOGGLE_TIMESTAMPER_LAYER : function(){
        this.oApp.exec("TOGGLE_TOOLBAR_ACTIVE_LAYER", [this.oDropdownLayer]);
    },
 
    $ON_PASTE_NOW_DATE : function(){
        this.oApp.exec("PASTE_HTML", [new Date()]);
    }
});
