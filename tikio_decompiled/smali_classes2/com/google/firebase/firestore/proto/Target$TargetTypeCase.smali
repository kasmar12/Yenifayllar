.class public final enum Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;
.super Ljava/lang/Enum;
.source "Target.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/proto/Target;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TargetTypeCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

.field public static final enum DOCUMENTS:Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

.field public static final enum QUERY:Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

.field public static final enum TARGETTYPE_NOT_SET:Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 27
    new-instance v0, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    const-string v1, "QUERY"

    const/4 v2, 0x0

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->QUERY:Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    .line 28
    new-instance v1, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    const-string v3, "DOCUMENTS"

    const/4 v4, 0x1

    const/4 v5, 0x6

    invoke-direct {v1, v3, v4, v5}, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->DOCUMENTS:Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    .line 29
    new-instance v3, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    const-string v5, "TARGETTYPE_NOT_SET"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v2}, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->TARGETTYPE_NOT_SET:Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 26
    sput-object v5, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->$VALUES:[Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 32
    iput p3, p0, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;
    .locals 1

    if-eqz p0, :cond_2

    const/4 v0, 0x5

    if-eq p0, v0, :cond_1

    const/4 v0, 0x6

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 45
    :cond_0
    sget-object p0, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->DOCUMENTS:Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    return-object p0

    .line 44
    :cond_1
    sget-object p0, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->QUERY:Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    return-object p0

    .line 46
    :cond_2
    sget-object p0, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->TARGETTYPE_NOT_SET:Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 39
    invoke-static {p0}, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->forNumber(I)Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;
    .locals 1

    .line 26
    const-class v0, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;
    .locals 1

    .line 26
    sget-object v0, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->$VALUES:[Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    invoke-virtual {v0}, [Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    .line 51
    iget v0, p0, Lcom/google/firebase/firestore/proto/Target$TargetTypeCase;->value:I

    return v0
.end method
