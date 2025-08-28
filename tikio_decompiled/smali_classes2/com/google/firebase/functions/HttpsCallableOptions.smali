.class public Lcom/google/firebase/functions/HttpsCallableOptions;
.super Ljava/lang/Object;
.source "HttpsCallableOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/functions/HttpsCallableOptions$Builder;
    }
.end annotation


# instance fields
.field private final limitedUseAppCheckTokens:Z


# direct methods
.method private constructor <init>(Z)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-boolean p1, p0, Lcom/google/firebase/functions/HttpsCallableOptions;->limitedUseAppCheckTokens:Z

    return-void
.end method

.method synthetic constructor <init>(ZLcom/google/firebase/functions/HttpsCallableOptions$1;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/google/firebase/functions/HttpsCallableOptions;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public getLimitedUseAppCheckTokens()Z
    .locals 1

    .line 36
    iget-boolean v0, p0, Lcom/google/firebase/functions/HttpsCallableOptions;->limitedUseAppCheckTokens:Z

    return v0
.end method
