.class public final enum Lcom/google/firestore/v1/Target$ResumeTypeCase;
.super Ljava/lang/Enum;
.source "Target.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/Target;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ResumeTypeCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/v1/Target$ResumeTypeCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/v1/Target$ResumeTypeCase;

.field public static final enum READ_TIME:Lcom/google/firestore/v1/Target$ResumeTypeCase;

.field public static final enum RESUMETYPE_NOT_SET:Lcom/google/firestore/v1/Target$ResumeTypeCase;

.field public static final enum RESUME_TOKEN:Lcom/google/firestore/v1/Target$ResumeTypeCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1250
    new-instance v0, Lcom/google/firestore/v1/Target$ResumeTypeCase;

    const-string v1, "RESUME_TOKEN"

    const/4 v2, 0x0

    const/4 v3, 0x4

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firestore/v1/Target$ResumeTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->RESUME_TOKEN:Lcom/google/firestore/v1/Target$ResumeTypeCase;

    .line 1251
    new-instance v1, Lcom/google/firestore/v1/Target$ResumeTypeCase;

    const-string v3, "READ_TIME"

    const/4 v4, 0x1

    const/16 v5, 0xb

    invoke-direct {v1, v3, v4, v5}, Lcom/google/firestore/v1/Target$ResumeTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/v1/Target$ResumeTypeCase;->READ_TIME:Lcom/google/firestore/v1/Target$ResumeTypeCase;

    .line 1252
    new-instance v3, Lcom/google/firestore/v1/Target$ResumeTypeCase;

    const-string v5, "RESUMETYPE_NOT_SET"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v2}, Lcom/google/firestore/v1/Target$ResumeTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/google/firestore/v1/Target$ResumeTypeCase;->RESUMETYPE_NOT_SET:Lcom/google/firestore/v1/Target$ResumeTypeCase;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/google/firestore/v1/Target$ResumeTypeCase;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 1249
    sput-object v5, Lcom/google/firestore/v1/Target$ResumeTypeCase;->$VALUES:[Lcom/google/firestore/v1/Target$ResumeTypeCase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1254
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 1255
    iput p3, p0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/v1/Target$ResumeTypeCase;
    .locals 1

    if-eqz p0, :cond_2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/16 v0, 0xb

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1268
    :cond_0
    sget-object p0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->READ_TIME:Lcom/google/firestore/v1/Target$ResumeTypeCase;

    return-object p0

    .line 1267
    :cond_1
    sget-object p0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->RESUME_TOKEN:Lcom/google/firestore/v1/Target$ResumeTypeCase;

    return-object p0

    .line 1269
    :cond_2
    sget-object p0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->RESUMETYPE_NOT_SET:Lcom/google/firestore/v1/Target$ResumeTypeCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firestore/v1/Target$ResumeTypeCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1262
    invoke-static {p0}, Lcom/google/firestore/v1/Target$ResumeTypeCase;->forNumber(I)Lcom/google/firestore/v1/Target$ResumeTypeCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/v1/Target$ResumeTypeCase;
    .locals 1

    .line 1249
    const-class v0, Lcom/google/firestore/v1/Target$ResumeTypeCase;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$ResumeTypeCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/v1/Target$ResumeTypeCase;
    .locals 1

    .line 1249
    sget-object v0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->$VALUES:[Lcom/google/firestore/v1/Target$ResumeTypeCase;

    invoke-virtual {v0}, [Lcom/google/firestore/v1/Target$ResumeTypeCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/v1/Target$ResumeTypeCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    .line 1274
    iget v0, p0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->value:I

    return v0
.end method
