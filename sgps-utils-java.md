properties
MD5
bc4b2e02788e131a39fb122c9056a6af
 
SHA-1
21cbdeaa87d05c299b6f12c058325dfe17816439
 
SHA-256
114acd90c007317e58f22edd76f4c91450ecb989a111c22dd857523da0c35a3d
 
SSDEEP
192:cdS6gRH7Aoy/+Xs3N7TMGIMPsyMwkvvol54fULZKNG1+7KfN+EYumuoK+6Oxf3vi:cdkRH7Az/+268j7MNc
 
TLSH
T17652B84127068D101C99D066E90860F78E9B962B0FFFFFA1B50E1E155F6640AF27CE6E
 
File type
Java 
source
java
 
Magic
Java source, ASCII text
 
TrID
file seems to be plain text/ASCII (0%)
 
Magika
JAVA
 
File size
13.21 KB (13529 bytes)
History
First Submission
2026-07-25 14:30:12 UTC
 
Last Submission
2026-07-25 14:30:12 UTC
 
Last Analysis
2026-07-25 14:30:12 UTC
Names
com.spreadtrum.sgps_com.spreadtrum.sgps.SgpsUtils.java

package com.spreadtrum.sgps;
import com.spreadtrum.sgps.LoadingDialog;
import java.util.ArrayList;
import android.content.DialogInterface;
import java.util.List;
import android.location.GnssStatus$Callback;
import android.widget.TextView;
import com.spreadtrum.sgps.SgpsUtils$GnssType;
import java.lang.Iterable;
import android.os.Bundle;
import com.spreadtrum.sgps.LogUtils;
import android.widget.CheckBox;
import com.spreadtrum.sgps.SgpsUtils$GPSGroupEnum;
import android.location.GnssStatus;
import android.util.ArrayMap;
import android.view.View;
import android.os.PowerManager$WakeLock;
import android.location.Location;
import android.widget.LinearLayout;
import java.lang.Object;
import java.lang.String;
import android.widget.ScrollView;
import com.spreadtrum.sgps.SgpsUtils$GPSModeEnum;
import android.content.Context;
import android.location.LocationManager;

public class SgpsUtils extends Object
{
/*
 * Field Definitions.
 */
      private static final int BEIDOU_SVID_OFFSET;
      public static final int COUNT_PRECISION;
      public static final int DIALOG_3RDMSISDN;
      public static final int DIALOG_AREA_MININTERVAL;
      public static final int DIALOG_AREA_STARTTIME;
      public static final int DIALOG_AREA_STOPTIME;
      public static final int DIALOG_AREA_TYPE_SELECT;
      public static final int DIALOG_CERTIFICATEVERIFICATION;
      public static final int DIALOG_CUSTOMER_CMD;
      public static final int DIALOG_DELAY;
      public static final int DIALOG_FL_VDR_MODE;
      public static final int DIALOG_FL_WORK_MODE;
      public static final int DIALOG_GEORADIUS;
      public static final int DIALOG_HORIZONTAL_ACCURACY;
      public static final int DIALOG_LATITUDE;
      public static final int DIALOG_LOCATIONAGE;
      public static final int DIALOG_LONGITUDE;
      public static final int DIALOG_MAXNUM;
      public static final int DIALOG_MSISDN;
      public static final int DIALOG_NI_DIALOG_TEST;
      public static final int DIALOG_PERODIC_MININTERVAL;
      public static final int DIALOG_PERODIC_STARTTIME;
      public static final int DIALOG_PERODIC_STOPTIME;
      public static final int DIALOG_POSMETHOD_SELECT;
      public static final int DIALOG_SLP_ADDRESS;
      public static final int DIALOG_SLP_PORT;
      public static final int DIALOG_SLP_TEMPLATE;
      public static final int DIALOG_VERTICAL_ACCURACY;
      public static final int DISMISS_PROGRESS_DIALOG;
      public static final String FIRST_TIME;
      private static final int GLONASS_SVID_OFFSET;
      public static final String GNSSBDMODEM;
      private static final String GNSSCHIP;
      public static final String GNSSMODEM;
      private static final String GPSCHIP;
      public static final String[] GPS_EXTRA_DATA;
      public static final String GPS_EXTRA_LOG_SWITCH_OFF;
      public static final String GPS_EXTRA_LOG_SWITCH_ON;
      public static final int HANDLE_AUTO_TRANSFER_START_BUTTON_UPDATE;
      public static final int HANDLE_AUTO_TRANSFER_UPDATE_CURRENT_MODE;
      public static final int HANDLE_CHANGE_FIRST_OPEN_SGPS_STATE;
      public static final int HANDLE_COMMAND_OTHERS_UPDATE_PROVIDER;
      public static final int HANDLE_COMMAND_OTHERS_UPDATE_RESULT_HINT;
      public static final int HANDLE_COMMAND_OTHERS_UPDATE_RESULT_LOG;
      public static final int HANDLE_COMMAND_OTHERS_UPDATE_RESULT_LOG_END;
      public static final int HANDLE_COUNTER;
      public static final int HANDLE_CUSTOM_CURVECHART;
      public static final int HANDLE_GET_IMAGE_MODE;
      public static final int HANDLE_INIT_AGPS_COMMON;
      public static final int HANDLE_INIT_AGPS_CONFIG_LAYOUT_STATUS;
      public static final int HANDLE_INIT_AGPS_CONTROL_PLANE;
      public static final int HANDLE_INIT_AGPS_PLANE_SWITCH;
      public static final int HANDLE_INIT_AGPS_USER_PLANE;
      public static final int HANDLE_INIT_COMMON_GNSS_MODE;
      public static final int HANDLE_INIT_MARLIN3_GNSS_MODE;
      public static final int HANDLE_INIT_SWITCH;
      public static final int HANDLE_READ_XML_FILE;
      public static final int HANDLE_RESET_TO_DEFAULT;
      public static final boolean ISGe2;
      public static final boolean ISMarlin3;
      public static final boolean ISMarlin3lite;
      public static final boolean ISMarlin3liteInteg;
      private static final int MAX_SATELLITES;
      public static final int ONE_SECOND;
      public static final String READ_CONFIG_ALL;
      public static final String READ_SUPL_ALL;
      private static final int SBAS_SVID_OFFSET;
      public static final String SGPS_VRESION;
      public static final int SHOW_PROGRESS_DIALOG;
      public static final String START_MODE;
      private static final String TAG;
      public static final String UART_LOG_SWITCH;
      public static final String WRITE_CONFIG_SINGLE;
      public static final String WRITE_SUPL_SINGLE;
      private LoadingDialog hwndLoadingDialog;
      private boolean locationWhenFirstFix;
      public String[] mAreaTypeArray;
      public String[] mAreaTypeArrayValues;
      private static final Object mAutoTransferTestRunningLock;
      public int mAutoTransferTotalTimes;
      private final float[] mAzimuth;
      private int[] mBeidouInUsed;
      private int[] mBeidouView;
      private final int[] mContForCN0;
      private static Context mContext;
      public int mCurrSCanPeriod;
      public int mCurrSCanPeriodCount;
      public int mCurrScanTimes;
      public int mCurrScanTimesCount;
      public SgpsUtils$GPSModeEnum mCurrentMode;
      public int mCurrentTimes;
      public LinearLayout mCurveChart;
      private float[] mDistance;
      public int mDistanceCont;
      private final float[] mElevation;
      private boolean mEnterCn0FirstFlag;
      private LogUtils mFileAutoTest;
      private LogUtils mFileNmea;
      private LogUtils mFileRssi;
      public boolean mFirstFix;
      private boolean mFirstFixFlag;
      private double[] mFirstFixLatitude;
      private double[] mFirstFixLongitude;
      private String mGe2Cn_Sr;
      private int[] mGlonassInUsed;
      private int[] mGlonassView;
      private GnssStatus mGnssStatus;
      private ArrayList mGnssStatusArrayList;
      private GnssStatus$Callback mGnssStatusListener;
      private int[] mGpsInUsed;
      private int[] mGpsView;
      private boolean mIsAutoTransferTestRunning;
      public static final Location mLastLocationRefence;
      public int mLastTtffValue;
      public LocationManager mLocationManager;
      public int mModeInterval;
      public String[] mNiDialogTestArray;
      public String[] mNiDialogTestArrayValues;
      public String[] mPosMethodArray;
      public String[] mPosMethodArrayValues;
      private final int[] mPrns;
      private final int[] mPrnsForCN0;
      public String mProvider;
      public String[] mSLPArray;
      public final ArrayList mSLPNameList;
      public final ArrayList mSLPValueList;
      private int[] mSateTracking;
      private final int[] mSatelliteInUsedandViewMaxValues;
      private final int[] mSatelliteInUsedandViewMinValues;
      private int mSatelliteTestCont;
      private int mSatellites;
      private PowerManager$WakeLock mScreenWakeLock;
      private boolean mSerchFirstSateFlag;
      private long mSerchFirstSateTime;
      public boolean mShowFirstFixLocate;
      private final float[] mSnrs;
      private final float[] mSrnsForCN0;
      private long mStartSerchTime;
      public String mStatus;
      private static ArrayMap mSuplArrayMap;
      public int mTTFFInterval;
      public int mTTFFTimeoutCont;
      public float mTestDistanceSum;
      public String mTestLatitude;
      public String mTestLongitude;
      public float mTestTTFFSum;
      public int mTimeoutValue;
      private int[] mTotalInused;
      private int[] mTotalView;
      private float[] mTtff;
      public boolean mTtffTimeoutFlag;
      public int mTtffValue;
      private int mTtffcont;
      private final int[] mUsedInFixMask;
      public final List mltFirstData;
      public final List mltSecondData;
      public final List mltThirdData;
/*
 * Declared Constructors.
 */
    public SgpsUtils(Context, LogUtils, LogUtils, LogUtils) { ... }
    static volatile int[] -$$Nest$fgetmContForCN0(SgpsUtils) { ... }
    static volatile boolean -$$Nest$fgetmEnterCn0FirstFlag(SgpsUtils) { ... }
    static volatile int[] -$$Nest$fgetmPrnsForCN0(SgpsUtils) { ... }
    static volatile boolean -$$Nest$fgetmSerchFirstSateFlag(SgpsUtils) { ... }
    static volatile float[] -$$Nest$fgetmSrnsForCN0(SgpsUtils) { ... }
    static volatile long -$$Nest$fgetmStartSerchTime(SgpsUtils) { ... }
    static volatile void -$$Nest$fputlocationWhenFirstFix(SgpsUtils, boolean) { ... }
    static volatile void -$$Nest$fputmEnterCn0FirstFlag(SgpsUtils, boolean) { ... }
    static volatile void -$$Nest$fputmFirstFixFlag(SgpsUtils, boolean) { ... }
    static volatile void -$$Nest$fputmGnssStatus(SgpsUtils, GnssStatus) { ... }
    static volatile void -$$Nest$fputmSerchFirstSateFlag(SgpsUtils, boolean) { ... }
    static volatile void -$$Nest$fputmSerchFirstSateTime(SgpsUtils, long) { ... }
    static volatile void -$$Nest$fputmStartSerchTime(SgpsUtils, long) { ... }
    static volatile void -$$Nest$msatelliteStateCN0(SgpsUtils, GnssStatus) { ... }
    static volatile void -$$Nest$mupdateGnssStatus(SgpsUtils, GnssStatus) { ... }
    static volatile void -$$Nest$mupdateGnssVersion(SgpsUtils) { ... }
    static volatile Context -$$Nest$sfgetmContext() { ... }
    public void SetCustomModeSystem(String) { ... }
    public Bundle StartGpsMode() { ... }
    public void acquireScreenWakeLock() { ... }
    public void addGnssStatusListener() { ... }
    private void adjustInUsedandViewMinMaxValue(int[]) { ... }
    private float calcAveValue(int[], int) { ... }
    public static void changeMapValue(String, String) { ... }
    public void closeLoadingDialog() { ... }
    public static String constructMylogFilename(String) { ... }
    public void doHANDLE_COMMAND_OTHERS_UPDATE_RESULT_HINT(TextView) { ... }
    public String doHANDLE_COMMAND_OTHERS_UPDATE_RESULT_LOG() { ... }
    public String doHANDLE_COMMAND_OTHERS_UPDATE_RESULT_LOG_END(boolean, float, float) { ... }
    public void doMakeText(View, String) { ... }
    public void doMySwitchChange(int, boolean) { ... }
    public void doNoiseScan(String, TextView[]) { ... }
    public void doNoiseScanCurveChart() { ... }
    public void domLocListener(Location, TextView) { ... }
    public void domScrollToBottom(TextView, ScrollView) { ... }
    private void emptyArray() { ... }
    private float[] extractValuesFromNoiseRssi(List) { ... }
    public static String getAGPSInfo(String, String) { ... }
    public SgpsUtils$GPSGroupEnum getGNSSMode() { ... }
    public static String getGPSInfo(String, String) { ... }
    public static SgpsUtils$GnssType getGnssConstellationType(int) { ... }
    public static void getGpsInfoFromXml(String) { ... }
    public int getSatelliteStatus(int[], float[], float[], float[], int, int, int[]) { ... }
    private String getSatelliteStatus(Iterable) { ... }
    public int getTruePositionListDefaultIndex() { ... }
    private static String getValueFromXML(String, String, String) { ... }
    public boolean getmIsAutoTransferTestRunning() { ... }
    private String[] getxLabel(int) { ... }
    private String[] getyLabel(float, boolean) { ... }
    public void initAGPSCheckBoxItemStatus(CheckBox, String) { ... }
    public void initAGPSTextViewItemStatus(TextView, String) { ... }
    public Bundle initAutoCircleTestThread(SgpsUtils$GPSModeEnum, int) { ... }
    public void initInfoTextViewItemStatus(TextView, String) { ... }
    public boolean isGpsOpen() { ... }
    public boolean isLocationFixed(Iterable) { ... }
    private static boolean isNumeric(String) { ... }
    private boolean isUsedInFix(int) { ... }
    static void lambda$doMySwitchChange$0(boolean, DialogInterface, int) { ... }
    public int modifyCountDown(int) { ... }
    private Bundle perpareGpsMode(int) { ... }
    public void release() { ... }
    public void removeGnssStatusListener() { ... }
    public void resetAGPSCheckBoxItemStatus(CheckBox, String, boolean) { ... }
    public void resetAGPSTextViewItemStatus(TextView, String, String) { ... }
    public void resetInfoTextViewItemStatus(TextView, String, String) { ... }
    private void satelliteStateCN0(GnssStatus) { ... }
    public static boolean setAGPSInfo(String, String, String) { ... }
    public void setCheckBoxListener(CheckBox, String) { ... }
    private boolean setCommandToProvider(SgpsUtils$GPSGroupEnum, String) { ... }
    public static boolean setGPSInfo(String, String, String) { ... }
    public void setMOLATrigger(boolean) { ... }
    private void setSatelliteInusedOrTracking(Iterable) { ... }
    public void setSatelliteStatus(int, int[], float[], float[], float[], int, int, int[]) { ... }
    public void setSatelliteStatus(Iterable) { ... }
    public void setSatelliteStatusForGe2(List) { ... }
    private static boolean setValueFromXML(String, String, String, String) { ... }
    public void setmIsAutoTransferTestRunning(boolean) { ... }
    public void showLoadingDialog(String) { ... }
    public boolean showSUPL2View(String) { ... }
    private String toString(float[], int) { ... }
    private String toString(int[], int) { ... }
    private void updateGnssStatus(GnssStatus) { ... }
    private void updateGnssVersion() { ... }
    public void updateSatelliteView(List) { ... }

} 
