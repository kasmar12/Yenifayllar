.class public Lcom/google/firebase/functions/HttpsCallableOptions$Builder;
.super Ljava/lang/Object;
.source "HttpsCallableOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/functions/HttpsCallableOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private limitedUseAppCheckTokens:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Lcom/google/firebase/functions/HttpsCallableOptions$Builder;->limitedUseAppCheckTokens:Z

    return-void
.end method


# virtual methods
.method public build()Lcom/google/firebase/functions/HttpsCallableOptions;
    .locals 3

    .line 61
    new-instance v0, Lcom/google/firebase/functions/HttpsCallableOptions;

    iget-boolean v1, p0, Lcom/google/firebase/functions/HttpsCallableOptions$Builder;->limitedUseAppCheckTokens:Z

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/functions/HttpsCallableOptions;-><init>(ZLcom/google/firebase/functions/HttpsCallableOptions$1;)V

    return-object v0
.end method

.method public getLimitedUseAppCheckTokens()Z
    .locals 1

    .line 55
    iget-boolean v0, p0, Lcom/google/firebase/functions/HttpsCallableOptions$Builder;->limitedUseAppCheckTokens:Z

    return v0
.end method

.method public setLimitedUseAppCheckTokens(Z)Lcom/google/firebase/functions/HttpsCallableOptions$Builder;
    .locals 0

    .line 49
    iput-boolean p1, p0, Lcom/google/firebase/functions/HttpsCallableOptions$Builder;->limitedUseAppCheckTokens:Z

    return-object p0
.end method
