//
//  DataProvider.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 14.02.2022.
//

#if DEBUG
let apiDataProvider = ApiDataProvider(interceptor: ApiRequestInterceptor.shared,
                                      eventMonitors: [ApiLogger.shared])
#else
let apiDataProvider = ApiDataProvider(interceptor: ApiRequestInterceptor.shared,
                                      eventMonitors: [])
#endif
