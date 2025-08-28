.class public final synthetic Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugin/common/EventChannel$EventSink;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-static {v0}, Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler;->lambda$onListen$0(Lio/flutter/plugin/common/EventChannel$EventSink;)V

    return-void
.end method
