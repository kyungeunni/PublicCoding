/*
 *	스마트에디터 코드 추가 버튼 기능 구현부 (CodeInsert)
 */

nhn.husky.SE_CodeInsert = jindo.$Class({
    name : "SE_CodeInsert",
    $init : function(elAppContainer){
		this._assignHTMLObjects(elAppContainer);
	},
	
	_assignHTMLObjects : function(elAppContainer){
	    this.oDropdownLayer =
	            cssquery.getSingle("DIV.husky_seditor_CodeInsert_layer", elAppContainer);
	    //div 레이어 안에 있는 input button을 cssquery로 찾는 부분.
	    this.oInputButton = cssquery.getSingle(".se_button_code", elAppContainer);
	},
	
	$ON_MSG_APP_READY : function() {
	    this.oApp.exec('REGISTER_UI_EVENT',
	    		["CodeInsert", "click", "SE_TOGGLE_CODEINSERT_LAYER"]);
	    // input button에 click 이벤트를 할당
	    this.oApp.registerBrowserEvent(this.oInputButton, 'click', 'PASTE_CODE_BACK');
	},
	
	$ON_SE_TOGGLE_CODEINSERT_LAYER : function(){
        this.oApp.exec("TOGGLE_TOOLBAR_ACTIVE_LAYER", [this.oDropdownLayer]);
    },
 
    $ON_PASTE_CODE_BACK : function(){
        this.oApp.exec("PASTE_HTML", ["&lt;pre&gt;&lt;code&gt;코드를 입력하세요&lt;/code&gt;&lt;/pre&gt;"]);
    }
});
