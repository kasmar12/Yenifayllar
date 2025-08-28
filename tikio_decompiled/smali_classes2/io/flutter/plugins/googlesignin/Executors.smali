.class public final Lio/flutter/plugins/googlesignin/Executors;
.super Ljava/lang/Object;
.source "Executors.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/googlesignin/Executors$UiThreadExecutor;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static uiThreadExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 31
    new-instance v0, Lio/flutter/plugins/googlesignin/Executors$UiThreadExecutor;

    invoke-direct {v0}, Lio/flutter/plugins/googlesignin/Executors$UiThreadExecutor;-><init>()V

    return-object v0
.end method
