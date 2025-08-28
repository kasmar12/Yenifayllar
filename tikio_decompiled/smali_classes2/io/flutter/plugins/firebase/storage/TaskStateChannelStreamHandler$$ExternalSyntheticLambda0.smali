.class public final synthetic Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCanceledListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

.field public final synthetic f$1:Lio/flutter/plugin/common/EventChannel$EventSink;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

    iput-object p2, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda0;->f$1:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method


# virtual methods
.method public final onCanceled()V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda0;->f$1:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->lambda$onListen$3$io-flutter-plugins-firebase-storage-TaskStateChannelStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;)V

    return-void
.end method
