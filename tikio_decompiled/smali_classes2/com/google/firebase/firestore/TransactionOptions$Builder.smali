.class public final Lcom/google/firebase/firestore/TransactionOptions$Builder;
.super Ljava/lang/Object;
.source "TransactionOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/TransactionOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private maxAttempts:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x5

    .line 36
    iput v0, p0, Lcom/google/firebase/firestore/TransactionOptions$Builder;->maxAttempts:I

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/firestore/TransactionOptions;)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x5

    .line 36
    iput v0, p0, Lcom/google/firebase/firestore/TransactionOptions$Builder;->maxAttempts:I

    .line 46
    invoke-static {p1}, Lcom/google/firebase/firestore/TransactionOptions;->access$000(Lcom/google/firebase/firestore/TransactionOptions;)I

    move-result p1

    iput p1, p0, Lcom/google/firebase/firestore/TransactionOptions$Builder;->maxAttempts:I

    return-void
.end method


# virtual methods
.method public build()Lcom/google/firebase/firestore/TransactionOptions;
    .locals 3

    .line 71
    new-instance v0, Lcom/google/firebase/firestore/TransactionOptions;

    iget v1, p0, Lcom/google/firebase/firestore/TransactionOptions$Builder;->maxAttempts:I

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/TransactionOptions;-><init>(ILcom/google/firebase/firestore/TransactionOptions$1;)V

    return-object v0
.end method

.method public setMaxAttempts(I)Lcom/google/firebase/firestore/TransactionOptions$Builder;
    .locals 1

    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    .line 60
    iput p1, p0, Lcom/google/firebase/firestore/TransactionOptions$Builder;->maxAttempts:I

    return-object p0

    .line 59
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Max attempts must be at least 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
