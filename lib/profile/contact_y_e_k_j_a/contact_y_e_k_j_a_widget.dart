import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contact_y_e_k_j_a_model.dart';
export 'contact_y_e_k_j_a_model.dart';

class ContactYEKJAWidget extends StatefulWidget {
  const ContactYEKJAWidget({super.key});

  static String routeName = 'ContactYEKJA';
  static String routePath = '/contactYEKJA';

  @override
  State<ContactYEKJAWidget> createState() => _ContactYEKJAWidgetState();
}

class _ContactYEKJAWidgetState extends State<ContactYEKJAWidget> {
  late ContactYEKJAModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactYEKJAModel());

    _model.messageTextController ??= TextEditingController();
    _model.messageFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 480.0,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 40.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'uaue3xf2' /* Welcome to support  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelLargeFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelLargeIsCustom,
                                  ),
                            ),
                            TextSpan(
                              text: FFAppState().userInfo.userName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelLargeIsCustom,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '18qj4qd2' /* Make sure you check our  */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .headlineSmallIsCustom,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'f2k084ch' /* FAQ */,
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).greenInit,
                                ),
                                mouseCursor: SystemMouseCursors.click,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    context.pushNamed(FaqWidget.routeName);
                                  },
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .headlineSmallIsCustom,
                                ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: 120.0,
                              constraints: BoxConstraints(
                                maxWidth: 500.0,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFBC2626),
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 16.0, 8.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.local_phone,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 36.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'ydnrk5zy' /* Call Us */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.fAQClicked =
                                    await MonitoringLogsTable().insert({
                                  'scrren_name': 'Contact',
                                  'action': 'FAQ',
                                  'user_id': currentUserUid,
                                });

                                context.pushNamed(FaqWidget.routeName);

                                safeSetState(() {});
                              },
                              child: Container(
                                width: 120.0,
                                constraints: BoxConstraints(
                                  maxWidth: 500.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFF046595),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 16.0, 8.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.search_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 36.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ofdaiisb' /* Search FAQs */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(null),
                              options: ContactSubject.values
                                  .map((e) => e)
                                  .toList()
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: (val) => safeSetState(
                                  () => _model.dropDownValue = val),
                              width: double.infinity,
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'uy7ff9ps' /* Choose a relevant subject */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: TextFormField(
                                controller: _model.messageTextController,
                                focusNode: _model.messageFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelMediumIsCustom,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '7p9q5poi' /* Please provide description of ... */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelMediumIsCustom,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16.0, 24.0, 16.0, 12.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                maxLines: 16,
                                minLines: 12,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primary,
                                validator: _model.messageTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 500.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final selectedMedia = await selectMedia(
                                        mediaSource: MediaSource.photoGallery,
                                        multiImage: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        safeSetState(() => _model
                                                .isDataUploading_uploadImages =
                                            true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                    originalFilename:
                                                        m.originalFilename,
                                                  ))
                                              .toList();
                                        } finally {
                                          _model.isDataUploading_uploadImages =
                                              false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFiles_uploadImages =
                                                selectedUploadedFiles;
                                          });
                                        } else {
                                          safeSetState(() {});
                                          return;
                                        }
                                      }
                                    },
                                    child: Icon(
                                      Icons.add_a_photo_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 32.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'qc3iypvs' /* Upload image */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              if (_model
                                  .uploadedLocalFiles_uploadImages.isNotEmpty)
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            safeSetState(() {
                                              _model.isDataUploading_uploadImages =
                                                  false;
                                              _model.uploadedLocalFiles_uploadImages =
                                                  [];
                                            });
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          final images = _model
                                              .uploadedLocalFiles_uploadImages
                                              .toList()
                                              .take(3)
                                              .toList();

                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                images.length, (imagesIndex) {
                                              final imagesItem =
                                                  images[imagesIndex];
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 1.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.memory(
                                                    imagesItem.bytes ??
                                                        Uint8List.fromList([]),
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            }).divide(SizedBox(width: 7.0)),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model
                                .uploadedLocalFiles_uploadImages.isNotEmpty) {
                              for (int loop1Index = 0;
                                  loop1Index <
                                      _model.uploadedLocalFiles_uploadImages
                                          .length;
                                  loop1Index++) {
                                final currentLoop1Item =
                                    _model.uploadedLocalFiles_uploadImages[
                                        loop1Index];
                                {
                                  safeSetState(() => _model
                                      .isDataUploading_uploadedimage = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                  var selectedMedia = <SelectedFile>[];
                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles =
                                        currentLoop1Item.bytes!.isNotEmpty
                                            ? [currentLoop1Item]
                                            : <FFUploadedFile>[];
                                    selectedMedia =
                                        selectedFilesFromUploadedFiles(
                                      selectedUploadedFiles,
                                      storageFolderPath: 'Contact_us',
                                    );
                                    downloadUrls =
                                        await uploadSupabaseStorageFiles(
                                      bucketName: 'yekja',
                                      selectedFiles: selectedMedia,
                                    );
                                  } finally {
                                    _model.isDataUploading_uploadedimage =
                                        false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile_uploadedimage =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl_uploadedimage =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    safeSetState(() {});
                                    return;
                                  }
                                }

                                _model.addToListOfimages(
                                    _model.uploadedFileUrl_uploadedimage);
                                safeSetState(() {});
                              }
                              _model.submitedContactWithImg =
                                  await ContactYekjaTable().insert({
                                'message': _model.messageTextController.text,
                                'subject': _model.dropDownValue,
                                'user_id': currentUserUid,
                                'img': _model.listOfimages,
                              });
                            } else {
                              _model.submitedContact =
                                  await ContactYekjaTable().insert({
                                'message': _model.messageTextController.text,
                                'subject': _model.dropDownValue,
                                'user_id': currentUserUid,
                              });
                            }

                            context.safePop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Your message was successfully submitted.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .lighterGreen,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0x426A966A),
                              ),
                            );

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'ziper6ve' /* Submit  */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsets.all(0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).greenInit,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 4.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 16.0))
                        .addToEnd(SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
