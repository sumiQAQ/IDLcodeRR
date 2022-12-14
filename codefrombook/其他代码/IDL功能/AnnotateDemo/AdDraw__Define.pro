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
;》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》
;
;紙夕怏周個延寄弌
;
PRO ADDraw::Resize, newx, newy

    COMPILE_OPT IDL2

    newx = newx > 0
    Widget_Control, self.drawID, Draw_XSize = newx, Draw_YSize = newy, $
                        XSize = newx, YSize = newy

    self.drawSize = [newx, newy]

END

;》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》-
;
;幹秀篇夕
;
PRO ADDraw::Create

    COMPILE_OPT IDL2

    oSystem = self.oSystem

    self.drawID = Widget_Draw(self.parent   , $
        UName = 'ADDraw::'+self.uName       , $
        Retain = 0                          , $
        XSize = self.drawSize[0]            , $
        YSize = self.drawSize[1]            , $
        Scr_XSize = self.drawSize[0]        , $
        Scr_YSize = self.drawSize[1]        , $
        Graphics_Level = 2                  , $
        /App_Scroll                         , $
        /Button_Events                      , $
        /Keyboard_Events                    , $
        /Wheel_Events                       , $
        /Expose_Events                      , $
        /Motion_Events                     )

    Widget_Control, self.drawID, Get_Value = oWindow
    self.oWindow = oWindow

    oColor = [0,0,0]
    self.oScene = Obj_New('IDLgrScene', Color = oColor)
    self.oWindow->SetProperty, Graphics_Tree = self.oScene
    self.oWindow->SetCurrentCursor, 'ARROW'

END

;》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》
;
;並周侃尖
;
PRO ADDraw::HandleEvent, event

    COMPILE_OPT IDL2

    oSystem = self.oSystem
    IF Tag_Names(event, /Structure_Name) EQ 'WIDGET_DRAW' THEN BEGIN
           IF event.type EQ 4 THEN BEGIN
              self.oWindow->Draw
           ENDIF
    ENDIF

    IF Obj_Valid(oSystem.oManager) THEN oSystem.oManager->HandleEvent, event
END

;》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》-
;
;裂更
;
PRO ADDraw::Cleanup

    COMPILE_OPT IDL2


END

;》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》-
;
;兜兵晒
;
FUNCTION ADDraw::Init, OSystem = oSystem ,$
                            Parent = parent ,$
                            UName = uName   , $
                            XSize = xSize, $
                            YSize = ySize

    COMPILE_OPT IDL2

    self.parent = parent
    self.oSystem = oSystem
    self.drawSize = [xSize, ySize]
    self.uName = uName

    self->Create

    Return, 1
END

;》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》-
;
;協吶
;
PRO ADDraw__Define

    COMPILE_OPT IDL2

    void = {ADDraw                      , $

         ;狼由歌方
         parent         :   0           , $
         drawSize       :  DblArr(2)    , $
         drawBase       :   0           , $
         drawID         :   0           , $
         uName          :   ''          , $

         ;狼由斤??
         oSystem        :  Obj_New()    , $
         oScene         :  Obj_New()    , $
         oWindow        :  Obj_New()      $
            }

END