.class public final synthetic Lio/flutter/plugins/firebase/auth/AuthStateChannelStreamHandler$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/firebase/auth/FirebaseAuth$AuthStateListener;


# instance fields
.field public final synthetic f$0:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic f$1:Ljava/util/Map;

.field public final synthetic f$2:Lio/flutter/plugin/common/EventChannel$EventSink;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/Map;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/AuthStateChannelStreamHandler$$ExternalSyntheticLambda0;->f$0:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p2, p0, Lio/flutter/plugins/firebase/auth/AuthStateChannelStreamHandler$$ExternalSyntheticLambda0;->f$1:Ljava/util/Map;

    iput-object p3, p0, Lio/flutter/plugins/firebase/auth/AuthStateChannelStreamHandler$$ExternalSyntheticLambda0;->f$2:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method


# virtual methods
.method public final onAuthStateChanged(Lcom/google/firebase/auth/FirebaseAuth;)V
    .locals 3

    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/AuthStateChannelStreamHandler$$ExternalSyntheticLambda0;->f$0:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/AuthStateChannelStreamHandler$$ExternalSyntheticLambda0;->f$1:Ljava/util/Map;

    iget-object v2, p0, Lio/flutter/plugins/firebase/auth/AuthStateChannelStreamHandler$$ExternalSyntheticLambda0;->f$2:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-static {v0, v1, v2, p1}, Lio/flutter/plugins/firebase/auth/AuthStateChannelStreamHandler;->lambda$onListen$0(Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/Map;Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/google/firebase/auth/FirebaseAuth;)V

    return-void
.end method
