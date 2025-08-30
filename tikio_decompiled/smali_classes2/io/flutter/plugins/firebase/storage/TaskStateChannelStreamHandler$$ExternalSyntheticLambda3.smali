.class public final synthetic Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/firebase/storage/OnPausedListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

.field public final synthetic f$1:Lio/flutter/plugin/common/EventChannel$EventSink;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda3;->f$0:Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

    iput-object p2, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda3;->f$1:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method


# virtual methods
.method public final onPaused(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda3;->f$0:Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda3;->f$1:Lio/flutter/plugin/common/EventChannel$EventSink;

    check-cast p1, Lcom/google/firebase/storage/StorageTask$ProvideError;

    invoke-virtual {v0, v1, p1}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->lambda$onListen$1$io-flutter-plugins-firebase-storage-TaskStateChannelStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/google/firebase/storage/StorageTask$ProvideError;)V

    return-void
.end method
