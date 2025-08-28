.class public final synthetic Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;

.field public final synthetic f$1:Lio/flutter/plugin/common/EventChannel$EventSink;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;

    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda0;->f$1:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;

    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda0;->f$1:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-virtual {v0, v1, p1}, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->lambda$onListen$3$io-flutter-plugins-firebase-firestore-streamhandler-TransactionStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
