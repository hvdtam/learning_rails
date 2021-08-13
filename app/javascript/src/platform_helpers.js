const {userAgent} = window.navigator
export const isIos = /iPhone|iPad/.test(userAgent)
export const isAndroid = /Android/.test(userAgent)
export const isMobile = isIos || isAndroid