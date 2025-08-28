.class public final synthetic Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/firebase/firestore/EventListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;

.field public final synthetic f$1:Lio/flutter/plugin/common/EventChannel$EventSink;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;

    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler$$ExternalSyntheticLambda0;->f$1:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method


# virtual methods
.method public final onEvent(Ljava/lang/Object;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;

    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler$$ExternalSyntheticLambda0;->f$1:Lio/flutter/plugin/common/EventChannel$EventSink;

    check-cast p1, Lcom/google/firebase/firestore/QuerySnapshot;

    invoke-virtual {v0, v1, p1, p2}, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;->lambda$onListen$0$io-flutter-plugins-firebase-firestore-streamhandler-QuerySnapshotsStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V

    return-void
.end method
