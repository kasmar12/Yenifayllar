.class public final synthetic Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugin/common/EventChannel$EventSink;

.field public final synthetic f$1:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/util/Map;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda3;->f$0:Lio/flutter/plugin/common/EventChannel$EventSink;

    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda3;->f$1:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda3;->f$0:Lio/flutter/plugin/common/EventChannel$EventSink;

    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda3;->f$1:Ljava/util/Map;

    invoke-static {v0, v1}, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->lambda$onListen$0(Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/util/Map;)V

    return-void
.end method
