.class Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver$2;
.super Ljava/lang/Object;
.source "ConnectivityBroadcastReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver;->sendEvent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver;


# direct methods
.method constructor <init>(Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver;)V
    .locals 0

    .line 87
    iput-object p1, p0, Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver$2;->this$0:Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 90
    iget-object v0, p0, Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver$2;->this$0:Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver;

    invoke-static {v0}, Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver;->access$200(Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver;)Lio/flutter/plugin/common/EventChannel$EventSink;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver$2;->this$0:Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver;

    invoke-static {v1}, Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver;->access$100(Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver;)Lio/flutter/plugins/connectivity/Connectivity;

    move-result-object v1

    invoke-virtual {v1}, Lio/flutter/plugins/connectivity/Connectivity;->getNetworkType()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    return-void
.end method
