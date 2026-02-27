*&---------------------------------------------------------------------*
*& Report ZTSTTEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztsttest.

DATA: BEGIN OF x_data,
        matnr TYPE mara-matnr,
        maktx TYPE makt-maktx,
        ernam TYPE mara-ernam,
        mtart TYPE mara-mtart,
        mbrsh TYPE mara-mbrsh,
        mmsta TYPE mara-mmsta,
        prdha TYPE mara-prdha,
        laeda TYPE mara-laeda,
        aenam TYPE mara-aenam,
        ersda TYPE mara-ersda,
      END OF x_data.
DATA x_data_tab TYPE TABLE OF x_data.
FIELD-SYMBOLS <fs_data> LIKE LINE OF x_data_tab.

SELECT mara~matnr makt~maktx mara~ernam mara~mtart mara~mbrsh mara~mmsta mara~prdha mara~laeda mara~aenam mara~ersda
  INTO TABLE x_data_tab
  FROM mara
  INNER JOIN makt
  ON mara~matnr = makt~matnr
  WHERE makt~spras = 'E'
  UP TO 10 ROWS.

LOOP AT x_data_tab ASSIGNING <fs_data>.
  WRITE : <fs_data>-matnr, <fs_data>-maktx, <fs_data>-ernam, <fs_data>-mtart, <fs_data>-mbrsh, <fs_data>-mmsta, <fs_data>-prdha, <fs_data>-laeda, <fs_data>-aenam, <fs_data>-ersda.
ENDLOOP.