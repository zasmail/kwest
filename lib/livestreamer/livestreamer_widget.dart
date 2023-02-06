import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/cloud_functions/cloud_functions.dart';
import '../flutter_flow/flutter_flow_mux_broadcast.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/services.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:wakelock/wakelock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LivestreamerWidget extends StatefulWidget {
  const LivestreamerWidget({
    Key? key,
    this.streamName,
  }) : super(key: key);

  final String? streamName;

  @override
  _LivestreamerWidgetState createState() => _LivestreamerWidgetState();
}

class _LivestreamerWidgetState extends State<LivestreamerWidget> {
  String? muxBroadcastPlaybackUrl;
  bool muxBroadcastIsLive = false;
  LiveStreamController? muxBroadcastController;
  final _initialAudioConfig = AudioConfig(
    channel: Channel.stereo,
  );
  final _initialVideoConfig = VideoConfig.withDefaultBitrate(
    resolution: Resolution.RESOLUTION_720,
  );
  bool _isSupportedPlatform = false;
  // variables for managing camera states
  bool _isCameraInitialized = false;
  bool _isFrontCamSelected = false;
  final _stopwatch = Stopwatch();
  String? _durationString;
  Timer? _timer;
  StreamsRecord? createdStream;
  int timerMilliseconds = 30000;
  String timerValue = StopWatchTimer.getDisplayTime(
    30000,
    hours: false,
    minute: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid || Platform.isIOS) {
      _isSupportedPlatform = true;
      _initCamera();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer?.cancel();
    Wakelock.disable();

    timerController.dispose();
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'kwestshun',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Cardo',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 36,
                fontWeight: FontWeight.normal,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).title2Family),
                lineHeight: 1,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: FlutterFlowMuxBroadcast(
                    isCameraInitialized: _isCameraInitialized,
                    isStreaming: muxBroadcastIsLive,
                    durationString: _durationString,
                    borderRadius: BorderRadius.circular(30),
                    controller: muxBroadcastController,
                    videoConfig: _initialVideoConfig,
                    onCameraRotateButtonTap: () async {
                      await switchCamera();
                      setState(
                          () => _isFrontCamSelected = !_isFrontCamSelected);
                    },
                    startButtonText: 'Start Stream',
                    startButtonIcon: Icon(
                      Icons.play_arrow_rounded,
                      color: Color(0xFFFAF6EB),
                      size: 24,
                    ),
                    startButtonOptions: FFButtonOptions(
                      width: 160,
                      height: 50,
                      color: FlutterFlowTheme.of(context).alternate,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).subtitle2Family,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).subtitle2Family),
                          ),
                      elevation: 0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    liveIcon: FaIcon(
                      FontAwesomeIcons.solidCircle,
                      color: Colors.red,
                      size: 10,
                    ),
                    liveText: 'Live',
                    liveTextStyle:
                        FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).subtitle2Family,
                              color: Colors.red,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).subtitle2Family),
                            ),
                    liveTextBackgroundColor: Color(0x8A000000),
                    durationTextStyle:
                        FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).subtitle2Family,
                              color: Colors.red,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).subtitle2Family),
                            ),
                    durationTextBackgroundColor: Color(0x8A000000),
                    liveContainerBorderRadius: BorderRadius.circular(8),
                    durationContainerBorderRadius: BorderRadius.circular(8),
                    rotateButtonColor: Color(0x8A000000),
                    rotateButtonIcon: Icon(
                      Icons.flip_camera_android,
                      color: Colors.white,
                      size: 24,
                    ),
                    stopButtonIcon: Icon(
                      Icons.stop_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    stopButtonColor: Colors.red,
                    onStartButtonTap: () async {
                      await startStreaming();

                      final streamsCreateData = createStreamsRecordData(
                        name: widget.streamName,
                        isLive: true,
                        url: muxBroadcastPlaybackUrl,
                        time: getCurrentTimestamp,
                      );
                      var streamsRecordReference =
                          StreamsRecord.collection.doc();
                      await streamsRecordReference.set(streamsCreateData);
                      createdStream = StreamsRecord.getDocumentFromData(
                          streamsCreateData, streamsRecordReference);
                      timerController.onExecute.add(StopWatchExecute.start);
                      // Update timer state
                      FFAppState().update(() {
                        FFAppState().timerComplete = false;
                      });

                      setState(() {});
                    },
                    onStopButtonTap: () async {
                      stopStreaming();

                      final streamsUpdateData = createStreamsRecordData(
                        isLive: false,
                      );
                      await createdStream!.reference.update(streamsUpdateData);

                      context.pushNamed('streams');
                    },
                  ),
                ),
              ),
              FlutterFlowTimer(
                initialTime: timerMilliseconds,
                getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                  value,
                  hours: false,
                  minute: false,
                ),
                timer: timerController,
                updateStateInterval: Duration(milliseconds: 1000),
                onChanged: (value, displayTime, shouldUpdate) {
                  timerMilliseconds = value;
                  timerValue = displayTime;
                  if (shouldUpdate) setState(() {});
                },
                onEnded: () async {
                  FFAppState().update(() {
                    FFAppState().timerComplete = true;
                  });
                },
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
              Text(
                'time\'s up! wrap it up.',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('streams');
                },
                text: 'next',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).subtitle2Family,
                        color: Colors.white,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).subtitle2Family),
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _initCamera() async {
    muxBroadcastController = initLiveStreamController();
    await muxBroadcastController!.create(
      initialAudioConfig: _initialAudioConfig,
      initialVideoConfig: _initialVideoConfig,
    );
    setState(() => _isCameraInitialized = true);
  }

  LiveStreamController initLiveStreamController() {
    return LiveStreamController(
      onConnectionSuccess: () {
        print('Connection succeeded');
        setState(() => muxBroadcastIsLive = true);
        _startTimer();
      },
      onConnectionFailed: (error) {
        print('Connection failed: $error');
        if (mounted) setState(() {});
      },
      onDisconnection: () {
        print('Disconnected');
        if (mounted) setState(() => muxBroadcastIsLive = false);
        _stopTimer();
      },
    );
  }

  Future<void> switchCamera() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      liveStreamController.switchCamera();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to switch camera: ${error.message}');
      } else {
        print('Failed to switch camera: $error');
      }
    }
  }

  Future<void> startStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    const streamBaseURL = 'rtmps://global-live.mux.com:443/app/';
    final callName = 'createLiveStream';
    final response = await makeCloudCall(callName, {});
    final streamKey = response['stream_key'];
    final playbackId = response['playback_ids'][0]['id'];
    muxBroadcastPlaybackUrl = 'https://stream.mux.com/$playbackId.m3u8';
    if (streamKey != null) {
      try {
        Wakelock.enable();
        await liveStreamController.startStreaming(
          streamKey: streamKey,
          url: streamBaseURL,
        );
      } catch (error) {
        if (error is PlatformException) {
          print("Error: failed to start stream: ${error.message}");
        } else {
          print("Error: failed to start stream: $error");
        }
      }
    }
  }

  Future<void> stopStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      Wakelock.disable();
      liveStreamController.stopStreaming();
      if (mounted) setState(() => muxBroadcastIsLive = false);
      _stopTimer();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to stop stream: ${error.message}');
      } else {
        print('Failed to stop stream: $error');
      }
    }
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _durationString = _getDurationString(_stopwatch.elapsed);
        });
      }
    });
  }

  void _stopTimer() {
    _stopwatch
      ..stop()
      ..reset();
    _durationString = _getDurationString(_stopwatch.elapsed);
    _timer?.cancel();
  }

  String _getDurationString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
