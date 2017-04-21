open Types
open Typeenv

exception ContradictionError of Variantenv.t * Kindenv.t * mono_type * mono_type
exception InclusionError     of Variantenv.t * Kindenv.t * mono_type * mono_type

type t

val empty : t

val add : t -> Tyvarid.t -> mono_type -> t

val find : t -> Tyvarid.t -> mono_type

val apply_to_mono_type : t -> mono_type -> mono_type

val apply_to_type_environment : t -> Typeenv.t -> Typeenv.t

val compose : t -> t -> t

val compose_list : t list -> t

val unify : Variantenv.t -> Kindenv.t -> mono_type -> mono_type -> (t * Kindenv.t)

val string_of_subst : t -> string