.class Lcom/google/firestore/bundle/BundledQuery$LimitType$1;
.super Ljava/lang/Object;
.source "BundledQuery.java"

# interfaces
.implements Lcom/google/protobuf/Internal$EnumLiteMap;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/bundle/BundledQuery$LimitType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/protobuf/Internal$EnumLiteMap<",
        "Lcom/google/firestore/bundle/BundledQuery$LimitType;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public findValueByNumber(I)Lcom/google/firestore/bundle/BundledQuery$LimitType;
    .locals 0

    .line 88
    invoke-static {p1}, Lcom/google/firestore/bundle/BundledQuery$LimitType;->forNumber(I)Lcom/google/firestore/bundle/BundledQuery$LimitType;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic findValueByNumber(I)Lcom/google/protobuf/Internal$EnumLite;
    .locals 0

    .line 85
    invoke-virtual {p0, p1}, Lcom/google/firestore/bundle/BundledQuery$LimitType$1;->findValueByNumber(I)Lcom/google/firestore/bundle/BundledQuery$LimitType;

    move-result-object p1

    return-object p1
.end method
