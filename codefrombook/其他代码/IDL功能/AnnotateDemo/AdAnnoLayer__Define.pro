;+
;  ゞIDL殻會譜柴〃
;   -方象辛篇晒嚥ENVI屈肝蝕窟
;        
; 幣箭旗鷹
;
; 恬宀: 境刔売
;
; 選狼圭塀??sdlcdyq@sina.com
;-
;;》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》-
;
;評茅侭嗤徨蚊
;
PRO AdAnnoLayer::DeleteAllLayer

    COMPILE_OPT IDL2

    oObj = self->Get(/All, Count = count)
    IF count GT 0 THEN BEGIN
       FOR i=0, count-1 DO $
         Obj_Destroy, oObj[i]
    ENDIF

END
;》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》-;
;耶紗徨蚊
;
PRO AdAnnoLayer::Refresh

    COMPILE_OPT IDL2

    oAnnotate = self->Get(/All, Count = count)
    IF count EQ 0 THEN Return
    oSystem = self.oSystem
    oManager = oSystem.oManager
    oManager.oView->GetProperty, Dimensions = viewDim, Viewplane_Rect = myView
    ratio = myView[2]/viewDim[0]

    FOR i=0,count-1 DO BEGIN
       oAnnotate[i]->RefreshDraw, ratio = ratio
    ENDFOR

END
;


;》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》-;
;耶紗徨蚊
;
PRO AdAnnoLayer::AddChild, object

    COMPILE_OPT IDL2

    ; 仟耶紗議炎廣慧壓恷貧中
    Self->Add, object, pos = 0

END
;
;》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》-
;
;裂更
;
PRO AdAnnoLayer::Cleanup

    COMPILE_OPT IDL2

    self->IDLgrModel::Cleanup

END

;》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》-
;
;兜兵晒
;
FUNCTION AdAnnoLayer::Init  , $
    UName = uName           , $
    Value = value           , $
    Project = project       , $
    Parent = parent

    COMPILE_OPT IDL2

    IF (self->IDLgrModel::Init(_Extra=extra) NE 1) THEN Return, 0

    self.project = project
    self.oSystem = parent.oSystem
    self.uName = uName
    ;
    parent->Add,self
    Return, 1
END

;》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》-
;
;協吶
;
PRO AdAnnoLayer__Define

    COMPILE_OPT IDL2

    void = {AdAnnoLayer                , $

        INHERITS IDLgrModel             , $

        ;歌方
        fileName        :    ''         , $
        uName           :    ''         , $

        ;斤??
        oSystem         : Obj_New()     , $
        project         : Obj_New()     , $
        oImage          : Obj_New()       }


END