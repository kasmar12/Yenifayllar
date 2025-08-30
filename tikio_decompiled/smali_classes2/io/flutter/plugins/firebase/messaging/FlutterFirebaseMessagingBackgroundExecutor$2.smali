.class Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$2;
.super Ljava/util/HashMap;
.source "FlutterFirebaseMessagingBackgroundExecutor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->executeDartCallbackInBackgroundIsolate(Landroid/content/Intent;Ljava/util/concurrent/CountDownLatch;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

.field final synthetic val$remoteMessageMap:Ljava/util/Map;


# direct methods
.method constructor <init>(Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;Ljava/util/Map;)V
    .locals 2

    .line 254
    iput-object p1, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$2;->this$0:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

    iput-object p2, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$2;->val$remoteMessageMap:Ljava/util/Map;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 256
    invoke-static {p1}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->access$000(Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string v0, "userCallbackHandle"

    invoke-virtual {p0, v0, p1}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "message"

    .line 257
    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
