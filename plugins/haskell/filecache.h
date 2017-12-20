/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Creator.
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
****************************************************************************/

#pragma once

#include <utils/fileutils.h>
#include <utils/temporarydirectory.h>

#include <QHash>

#include <functional>

namespace Core { class IDocument; }

namespace Haskell {
namespace Internal {

class FileCache
{
public:
    FileCache(const QString &id,
              const std::function<QList<Core::IDocument *>()> &documentsToUpdate);

    void update();
    QHash<Utils::FileName, Utils::FileName> fileMap() const;

private:
    void writeFile(Core::IDocument *document);
    void cleanUp(const QList<Core::IDocument *> &documents);
    Utils::FileName createCacheFile(const Utils::FileName &filePath);

    Utils::TemporaryDirectory m_tempDir;
    QHash<Utils::FileName, Utils::FileName> m_fileMap;
    QHash<Utils::FileName, int> m_fileRevision;
    std::function<QList<Core::IDocument *>()> m_documentsToUpdate;
};

} // namespace Internal
} // namespace Haskell