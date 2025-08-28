.class public final synthetic Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

.field public final synthetic f$1:Lio/flutter/plugin/common/EventChannel$EventSink;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

    iput-object p2, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda1;->f$1:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda1;->f$1:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-virtual {v0, v1, p1}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->lambda$onListen$4$io-flutter-plugins-firebase-storage-TaskStateChannelStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/lang/Exception;)V

    return-void
.end method
