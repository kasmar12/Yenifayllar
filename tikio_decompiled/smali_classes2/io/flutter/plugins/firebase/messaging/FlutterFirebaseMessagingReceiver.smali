.class public Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingReceiver;
.super Landroid/content/BroadcastReceiver;
.source "FlutterFirebaseMessagingReceiver.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "FLTFireMsgReceiver"

.field static notifications:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/google/firebase/messaging/RemoteMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 16
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingReceiver;->notifications:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    const-string v0, "FLTFireMsgReceiver"

    const-string v1, "broadcast received for message"

    .line 20
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/ContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_0

    .line 22
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lio/flutter/plugins/firebase/messaging/ContextHolder;->setApplicationContext(Landroid/content/Context;)V

    .line 25
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    if-nez v1, :cond_1

    const-string p1, "broadcast received but intent contained no extras to process RemoteMessage. Operation cancelled."

    .line 26
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 32
    :cond_1
    new-instance v0, Lcom/google/firebase/messaging/RemoteMessage;

    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    invoke-direct {v0, p2}, Lcom/google/firebase/messaging/RemoteMessage;-><init>(Landroid/os/Bundle;)V

    .line 35
    invoke-virtual {v0}, Lcom/google/firebase/messaging/RemoteMessage;->getNotification()Lcom/google/firebase/messaging/RemoteMessage$Notification;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 36
    sget-object p2, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingReceiver;->notifications:Ljava/util/HashMap;

    invoke-virtual {v0}, Lcom/google/firebase/messaging/RemoteMessage;->getMessageId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingStore;->getInstance()Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingStore;

    move-result-object p2

    invoke-virtual {p2, v0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingStore;->storeFirebaseMessage(Lcom/google/firebase/messaging/RemoteMessage;)V

    .line 43
    :cond_2
    invoke-static {p1}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingUtils;->isApplicationForeground(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 44
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseRemoteMessageLiveData;->getInstance()Lio/flutter/plugins/firebase/messaging/FlutterFirebaseRemoteMessageLiveData;

    move-result-object p1

    invoke-virtual {p1, v0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseRemoteMessageLiveData;->postRemoteMessage(Lcom/google/firebase/messaging/RemoteMessage;)V

    return-void

    .line 51
    :cond_3
    new-instance p2, Landroid/content/Intent;

    const-class v1, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;

    invoke-direct {p2, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "notification"

    .line 53
    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 55
    invoke-static {p1, p2}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->enqueueMessageProcessing(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
