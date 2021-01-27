module Page = {
    type scrollRegion = { top: int, left: int }

    type t<'pageProps, 'rememberedState> = {
        component: string,
        props: 'pageProps,
        url: string,
        version: Js.Nullable.t<string>,
        scrollRegions: array<scrollRegion>,
        rememberedState: 'rememberedState
    }
}

type _inertia = ()

@bs.module("@inertiajs/inertia")
external _inertia: _inertia = "Inertia"

@bs.send
external _visit: _inertia => (string, 'visitProps) => () = "visit"

let visit = (
    ~method: option<string> = ?,
    ~replace: option<bool> = ?,
    ~preserveScroll: option<Page.t<'pageProps, 'state> => bool> = ?,
    ~preserveState: option<Page.t<'pageProps, 'state> => bool> = ?,
    ~only: option<array<string>> = ?,
    ~onCancel: option<() => ()> = ?,
    ~onFinish: option<() => ()> = ?,
    ~onSuccess: option<Page.t<'pageProps, 'state> => ()> = ?,
    ~onError: option<{..} => ()> = ?,
    ~headers: option<{..}> = ?,
    ~onCancelToken: option<{..} => ()> = ?,
    // onStart?: (visit: VisitOptions & {url: string}) => void | boolean
    // onProgress?: (progress: ProgressEvent) => void
    url: string,
) => _visit(_inertia, url, {
    "method": method,
    "replace": replace,
    "preserveScroll": preserveScroll,
    "preserveState": preserveState,
    "only": only,
    "onCancel": onCancel,
    "onFinish": onFinish,
    "onSuccess": onSuccess,
    "onError": onError,
    "headers": headers,
    "onCancelToken": onCancelToken,
})

module React = {
    @bs.module("@inertiajs/inertia-react")
    external usePage: () => Page.t<'a, {}> = "usePage"

    let usePageProps: () => 'a = () => {
        usePage().props
    }

    module Link = {
        @bs.module("@inertiajs/inertia-react")
        @react.component
        external make: (
            ~href: string,
            ~\"as": string = ?,
            ~data: 'data = ?,
            ~method: string = ?,
            ~headers: 'headers = ?,
            ~onClick: ReactEvent.Mouse.t => () = ?,
            ~preserveScroll: 'pageProps => bool = ?,
            ~preserveState: 'pageProps => bool = ?,
            ~replace: bool=?,
            ~only: array<string> = ?,
            // onCancelToken?: (Axios.CancelTokenSource) => void
            ~onBefore: () => () = ?,
            ~onStart: () => () = ?,
            ~onProgress: float => () = ?,
            ~onFinish: () => () = ?,
            ~onCancel: () => () = ?,
            ~onSuccess: () => () = ?,
            ~children: React.element,
        ) => React.element = "InertiaLink"
    }
}
